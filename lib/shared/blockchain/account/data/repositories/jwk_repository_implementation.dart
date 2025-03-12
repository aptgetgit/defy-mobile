import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:objectbox/objectbox.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/db_utils.dart';
import '../../domain/entities/aptos_derivation_path.dart';
import '../../domain/entities/json_web_key.dart';
import '../../domain/repositories/jwk_repository_interface.dart';
import '../models/local/ed25519_auth_key_config_local_model.dart';
import '../models/local/hd_key_local_model.dart';
import '../models/local/jwk_local_model.dart';
import '../models/local/signing_key_local_model.dart';
import '../sources/local/ed25519_auth_key_config_local_data_source.dart';
import '../sources/local/entropy_local_data_source.dart';
import '../sources/local/hd_key_local_data_source.dart';
import '../sources/local/jwk_local_data_source.dart';
import '../sources/local/private_jwk_local_data_source.dart';
import '../sources/local/signing_key_local_data_source.dart';

class _DeleteContext {
  _DeleteContext({
    required this.shouldDeletePrivateKey,
    required this.shouldDeleteEntropy,
    required this.entropyHash,
  });

  final bool shouldDeletePrivateKey;
  final bool shouldDeleteEntropy;
  final Option<Uint8List> entropyHash;
}

class JwkRepository implements IJwkRepository {
  JwkRepository({
    required Store store,
    required JwkDataSource jwkDataSource,
    required HDKeyDataSource hdKeyDataSource,
    required SigningKeyDataSource signingKeyDataSource,
    required Ed25519AuthKeyConfigLocalDataSource ed25519AuthKeyConfigDataSource,
    required EntropyDataSource entropyDataSource,
    required PrivateJwkDataSource privateJwkDataSource,
  }) : _store = store,
       _jwkDataSource = jwkDataSource,
       _hdKeyDataSource = hdKeyDataSource,
       _signingKeyDataSource = signingKeyDataSource,
       _ed25519AuthKeyConfigDataSource = ed25519AuthKeyConfigDataSource,
       _entropyDataSource = entropyDataSource,
       _privateJwkDataSource = privateJwkDataSource;

  final Store _store;
  final JwkDataSource _jwkDataSource;
  final HDKeyDataSource _hdKeyDataSource;
  final SigningKeyDataSource _signingKeyDataSource;
  final Ed25519AuthKeyConfigLocalDataSource _ed25519AuthKeyConfigDataSource;
  final EntropyDataSource _entropyDataSource;
  final PrivateJwkDataSource _privateJwkDataSource;

  @override
  TaskEither<ExceptionWithStackTrace, Jwk> store({
    required Jwk jwk,
    required KeySourceConfig config,
  }) => TaskEither<ExceptionWithStackTrace, Jwk>(() async {
    try {
      switch (config) {
        case HDKeySourceConfig(:final Uint8List entropyHash):
          {
            final Either<ExceptionWithStackTrace, bool> entropyExists =
                await _entropyDataSource.has(hash: entropyHash).run();
            if (entropyExists.isLeft()) {
              return left(entropyExists.getLeft().toNullable()!);
            }
            if (!entropyExists.isRight() ||
                !entropyExists.getRight().toNullable()!) {
              throw StateError('Cannot store: entropy not found');
            }
          }

        case SigningKeySourceConfig():
          {
            final Either<ExceptionWithStackTrace, bool> privateKeyExists =
                await _privateJwkDataSource.has(keyId: jwk.keyId).run();
            if (privateKeyExists.isLeft()) {
              return left(privateKeyExists.getLeft().toNullable()!);
            }
            if (!privateKeyExists.isRight() ||
                !privateKeyExists.getRight().toNullable()!) {
              throw StateError('Cannot store: private key not found');
            }
          }
      }
      final IOEither<ExceptionWithStackTrace, Jwk> computation =
          IOEither<ExceptionWithStackTrace, Jwk>(() {
            switch (config) {
              case HDKeySourceConfig(
                :final Uint8List entropyHash,
                :final AptosDerivationPath derivationPath,
              ):
                {
                  _hdKeyDataSource
                      .store(
                        keyId: jwk.keyId,
                        entropyHash: entropyHash,
                        derivationPath: derivationPath.toBytes(),
                      )
                      .run();
                }

              case SigningKeySourceConfig(:final Uint8List jwkThumbprint):
                {
                  _signingKeyDataSource
                      .store(keyId: jwk.keyId, jwkThumbprint: jwkThumbprint)
                      .run();
                }
            }
            return _jwkDataSource
                .store(jwk: jwk)
                .run()
                .map((JwkLocalModel model) => model.toDomain());
          });
      return await runInsideTransaction(TxMode.write, computation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, _DeleteContext> _prepareDelete(
    Uint8List keyId,
  ) => IOEither<ExceptionWithStackTrace, _DeleteContext>(() {
    final Either<ExceptionWithStackTrace, Option<HDKeyLocalModel>> hdConfig =
        _hdKeyDataSource.getByKeyId(keyId: keyId).run();

    if (hdConfig.isLeft()) {
      return left(hdConfig.getLeft().toNullable()!);
    }

    final Either<ExceptionWithStackTrace, Option<SigningKeyLocalModel>>
    signingConfig = _signingKeyDataSource.getByKeyId(keyId: keyId).run();

    if (signingConfig.isLeft()) {
      return left(signingConfig.getLeft().toNullable()!);
    }
    bool shouldDeleteEntropy = false;
    Option<Uint8List> entropyHash = none();

    if (hdConfig.getRight().toNullable()!.isSome()) {
      final HDKeyLocalModel hdKeyModel =
          hdConfig.getRight().toNullable()!.toNullable()!;
      entropyHash = Option<Uint8List>.of(hdKeyModel.entropyHash);

      final Either<ExceptionWithStackTrace, Set<HDKeyLocalModel>>
      entropyKeysResult =
          _hdKeyDataSource
              .getByEntropy(entropyHash: hdKeyModel.entropyHash)
              .run();

      if (entropyKeysResult.isLeft()) {
        return left(entropyKeysResult.getLeft().toNullable()!);
      }
      // TODO: Improve this, make the should delete entropy check more concrete
      shouldDeleteEntropy =
          entropyKeysResult.getRight().toNullable()!.length <= 1;
    }

    final bool shouldDeletePrivateKey =
        signingConfig.getRight().toNullable()!.isSome();

    return right(
      _DeleteContext(
        shouldDeletePrivateKey: shouldDeletePrivateKey,
        shouldDeleteEntropy: shouldDeleteEntropy,
        entropyHash: entropyHash,
      ),
    );
  });

  IOEither<ExceptionWithStackTrace, Unit> _executeDelete(Uint8List keyId) =>
      IOEither<ExceptionWithStackTrace, Unit>(() {
        final Either<ExceptionWithStackTrace, Unit> jwkResult =
            _jwkDataSource.deleteByKeyId(keyId: keyId).run();

        if (jwkResult.isLeft()) {
          return jwkResult;
        }

        final Either<ExceptionWithStackTrace, Unit> hdKeyResult =
            _hdKeyDataSource.deleteByKeyId(keyId: keyId).run();

        if (hdKeyResult.isLeft()) {
          return hdKeyResult;
        }

        final Either<ExceptionWithStackTrace, Unit> signingKeyResult =
            _signingKeyDataSource.deleteByKeyId(keyId: keyId).run();

        if (signingKeyResult.isLeft()) {
          return signingKeyResult;
        }

        return right(unit);
      });

  TaskEither<ExceptionWithStackTrace, Unit> _executeSecureStorageDeletions(
    Uint8List keyId,
    _DeleteContext context,
  ) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    if (context.shouldDeletePrivateKey) {
      final Either<ExceptionWithStackTrace, Unit> privateKeyResult =
          await _privateJwkDataSource.delete(keyId: keyId).run();

      if (privateKeyResult.isLeft()) {
        return privateKeyResult;
      }
    }

    if (context.shouldDeleteEntropy && context.entropyHash.isSome()) {
      final Either<ExceptionWithStackTrace, Unit> entropyResult =
          await _entropyDataSource
              .delete(hash: context.entropyHash.toNullable()!)
              .run();

      if (entropyResult.isLeft()) {
        return entropyResult;
      }
    }

    return right(unit);
  });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> delete({
    required Uint8List keyId,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    try {
      final Either<
        ExceptionWithStackTrace,
        Option<Ed25519AuthKeyConfigLocalModel>
      >
      authKeyExists =
          _ed25519AuthKeyConfigDataSource.getByKeyId(keyId: keyId).run();

      if (authKeyExists.isLeft()) {
        return left(authKeyExists.getLeft().toNullable()!);
      }

      if (authKeyExists.getRight().toNullable()!.isSome()) {
        throw StateError('Cannot delete: JWK is used in auth configuration');
      }

      final Either<ExceptionWithStackTrace, _DeleteContext> prepareResult =
          _prepareDelete(keyId).run();

      if (prepareResult.isLeft()) {
        return left(prepareResult.getLeft().toNullable()!);
      }

      final _DeleteContext context = prepareResult.getRight().toNullable()!;

      final Either<ExceptionWithStackTrace, Unit> deleteResult =
          await runInsideTransaction(
            TxMode.write,
            _executeDelete(keyId),
          ).run(_store);

      if (deleteResult.isLeft()) {
        return deleteResult;
      }

      return _executeSecureStorageDeletions(keyId, context).run();
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> deleteMany({
    required Set<Uint8List> keyIds,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    if (keyIds.isEmpty) {
      return right(unit);
    }

    try {
      for (final Uint8List keyId in keyIds) {
        final Either<
          ExceptionWithStackTrace,
          Option<Ed25519AuthKeyConfigLocalModel>
        >
        authKeyExists =
            _ed25519AuthKeyConfigDataSource.getByKeyId(keyId: keyId).run();

        if (authKeyExists.isLeft()) {
          return left(authKeyExists.getLeft().toNullable()!);
        }

        if (authKeyExists.getRight().toNullable()!.isSome()) {
          throw StateError('Cannot delete: JWK is used in auth configuration');
        }
      }

      final Map<Uint8List, _DeleteContext> deleteContexts =
          <Uint8List, _DeleteContext>{};

      for (final Uint8List keyId in keyIds) {
        final Either<ExceptionWithStackTrace, _DeleteContext> prepareResult =
            _prepareDelete(keyId).run();

        if (prepareResult.isLeft()) {
          return left(prepareResult.getLeft().toNullable()!);
        }

        deleteContexts[keyId] = prepareResult.getRight().toNullable()!;
      }

      for (final Uint8List keyId in keyIds) {
        final Either<ExceptionWithStackTrace, Unit> deleteResult =
            await runInsideTransaction(
              TxMode.write,
              _executeDelete(keyId),
            ).run(_store);

        if (deleteResult.isLeft()) {
          return deleteResult;
        }
      }

      for (final Uint8List keyId in keyIds) {
        final Either<ExceptionWithStackTrace, Unit> secureDeleteResult =
            await _executeSecureStorageDeletions(
              keyId,
              deleteContexts[keyId]!,
            ).run();

        if (secureDeleteResult.isLeft()) {
          return secureDeleteResult;
        }
      }

      return right(unit);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Unit>
  clear() => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    try {
      final Either<ExceptionWithStackTrace, Set<JwkLocalModel>> jwksResult =
          _jwkDataSource.getAll().run();

      if (jwksResult.isLeft()) {
        return left(jwksResult.getLeft().toNullable()!);
      }

      final Set<JwkLocalModel> jwks = jwksResult.getRight().toNullable()!;

      for (final JwkLocalModel jwk in jwks) {
        final Either<
          ExceptionWithStackTrace,
          Option<Ed25519AuthKeyConfigLocalModel>
        >
        authKeyResult =
            _ed25519AuthKeyConfigDataSource.getByKeyId(keyId: jwk.keyId).run();

        if (authKeyResult.isLeft()) {
          return left(authKeyResult.getLeft().toNullable()!);
        }

        if (authKeyResult.getRight().toNullable()!.isSome()) {
          throw StateError(
            'Cannot clear: some JWKs are used in auth configuration',
          );
        }
      }

      final Either<ExceptionWithStackTrace, Set<HDKeyLocalModel>>
      hdConfigsResult = _hdKeyDataSource.getAll().run();

      if (hdConfigsResult.isLeft()) {
        return left(hdConfigsResult.getLeft().toNullable()!);
      }

      final Set<HDKeyLocalModel> hdConfigs =
          hdConfigsResult.getRight().toNullable()!;

      final Either<ExceptionWithStackTrace, Set<SigningKeyLocalModel>>
      signingConfigsResult = _signingKeyDataSource.getAll().run();

      if (signingConfigsResult.isLeft()) {
        return left(signingConfigsResult.getLeft().toNullable()!);
      }

      final Set<SigningKeyLocalModel> signingConfigs =
          signingConfigsResult.getRight().toNullable()!;

      final IOEither<ExceptionWithStackTrace, Unit> clearOperation =
          IOEither<ExceptionWithStackTrace, Unit>(() {
            final Either<ExceptionWithStackTrace, Unit> jwkClearResult =
                _jwkDataSource.clear().run();

            if (jwkClearResult.isLeft()) {
              return jwkClearResult;
            }

            final Either<ExceptionWithStackTrace, Unit> hdKeyClearResult =
                _hdKeyDataSource.clear().run();

            if (hdKeyClearResult.isLeft()) {
              return hdKeyClearResult;
            }

            final Either<ExceptionWithStackTrace, Unit> signingKeyClearResult =
                _signingKeyDataSource.clear().run();

            if (signingKeyClearResult.isLeft()) {
              return signingKeyClearResult;
            }

            return right(unit);
          });

      final Either<ExceptionWithStackTrace, Unit> clearResult =
          await runInsideTransaction(TxMode.write, clearOperation).run(_store);

      if (clearResult.isLeft()) {
        return clearResult;
      }

      for (final HDKeyLocalModel config in hdConfigs) {
        final Either<ExceptionWithStackTrace, Unit> entropyResult =
            await _entropyDataSource.delete(hash: config.entropyHash).run();

        if (entropyResult.isLeft()) {
          return left(entropyResult.getLeft().toNullable()!);
        }
      }

      for (final SigningKeyLocalModel config in signingConfigs) {
        final Either<ExceptionWithStackTrace, Unit> privateKeyResult =
            await _privateJwkDataSource.delete(keyId: config.jwkKeyId).run();

        if (privateKeyResult.isLeft()) {
          return left(privateKeyResult.getLeft().toNullable()!);
        }
      }

      return right(unit);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  IOEither<ExceptionWithStackTrace, Option<Jwk>> get({
    required Uint8List keyId,
  }) => IOEither<ExceptionWithStackTrace, Option<Jwk>>(() {
    try {
      return _jwkDataSource
          .getByKeyId(keyId: keyId)
          .run()
          .map(
            (Option<JwkLocalModel> model) =>
                model.map((JwkLocalModel model) => model.toDomain()),
          );
    } on Exception catch (error, stackTrace) {
      return left(ExceptionWithStackTrace(error, stackTrace));
    }
  });

  @override
  IOEither<ExceptionWithStackTrace, bool> has({required Uint8List keyId}) =>
      IOEither<ExceptionWithStackTrace, bool>(() {
        try {
          return _jwkDataSource
              .getByKeyId(keyId: keyId)
              .run()
              .map((Option<JwkLocalModel> model) => model.isSome());
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  @override
  IOEither<ExceptionWithStackTrace, Set<Jwk>> getAll() =>
      IOEither<ExceptionWithStackTrace, Set<Jwk>>(() {
        try {
          return _jwkDataSource.getAll().run().map(
            (Set<JwkLocalModel> models) =>
                models.map((JwkLocalModel model) => model.toDomain()).toSet(),
          );
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  @override
  IOEither<ExceptionWithStackTrace, int> count() =>
      IOEither<ExceptionWithStackTrace, int>(() {
        try {
          return _jwkDataSource.count().run();
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  @override
  IOEither<ExceptionWithStackTrace, Option<HDKeySourceConfig>>
  getHDKeySourceConfig({required Uint8List keyId}) =>
      IOEither<ExceptionWithStackTrace, Option<HDKeySourceConfig>>(() {
        try {
          return _hdKeyDataSource
              .getByKeyId(keyId: keyId)
              .run()
              .map(
                (Option<HDKeyLocalModel> keyOption) => keyOption.map(
                  (HDKeyLocalModel key) => HDKeySourceConfig(
                    entropyHash: key.entropyHash,
                    derivationPath: AptosDerivationPath.fromBytes(
                      key.derivationPath,
                    ),
                  ),
                ),
              );
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  @override
  IOEither<ExceptionWithStackTrace, Option<SigningKeySourceConfig>>
  getSigningKeySourceConfig({required Uint8List keyId}) =>
      IOEither<ExceptionWithStackTrace, Option<SigningKeySourceConfig>>(() {
        try {
          return _signingKeyDataSource
              .getByKeyId(keyId: keyId)
              .run()
              .map(
                (Option<SigningKeyLocalModel> keyOption) => keyOption.map(
                  (SigningKeyLocalModel key) =>
                      SigningKeySourceConfig(jwkThumbprint: key.jwkThumbprint),
                ),
              );
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  @override
  IOEither<ExceptionWithStackTrace, Set<(Uint8List, HDKeySourceConfig)>>
  getAllHDKeySourceConfigs() =>
      IOEither<ExceptionWithStackTrace, Set<(Uint8List, HDKeySourceConfig)>>(
        () {
          try {
            return _hdKeyDataSource.getAll().run().map(
              (Set<HDKeyLocalModel> models) =>
                  models
                      .map(
                        (HDKeyLocalModel key) => (
                          key.jwkKeyId,
                          HDKeySourceConfig(
                            entropyHash: key.entropyHash,
                            derivationPath: AptosDerivationPath.fromBytes(
                              key.derivationPath,
                            ),
                          ),
                        ),
                      )
                      .toSet(),
            );
          } on Exception catch (error, stackTrace) {
            return left(ExceptionWithStackTrace(error, stackTrace));
          }
        },
      );

  @override
  IOEither<ExceptionWithStackTrace, Set<(Uint8List, SigningKeySourceConfig)>>
  getAllSigningKeySourceConfigs() => IOEither<
    ExceptionWithStackTrace,
    Set<(Uint8List, SigningKeySourceConfig)>
  >(() {
    try {
      return _signingKeyDataSource.getAll().run().map(
        (Set<SigningKeyLocalModel> models) =>
            models
                .map(
                  (SigningKeyLocalModel key) => (
                    key.jwkKeyId,
                    SigningKeySourceConfig(jwkThumbprint: key.jwkThumbprint),
                  ),
                )
                .toSet(),
      );
    } on Exception catch (error, stackTrace) {
      return left(ExceptionWithStackTrace(error, stackTrace));
    }
  });
}
