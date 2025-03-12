import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/crypto_utils.dart';
import '../../../../utils/db_utils.dart';
import '../../domain/repositories/entropy_repository_interface.dart';
import '../models/local/hd_key_local_model.dart';
import '../sources/local/entropy_local_data_source.dart';
import '../sources/local/hd_key_local_data_source.dart';

class EntropyRepository implements IEntropyRepository {
  EntropyRepository({
    required Store store,
    required EntropyDataSource entropyDataSource,
    required HDKeyDataSource hdKeyDataSource,
  }) : _store = store,
       _entropyDataSource = entropyDataSource,
       _hdKeyDataSource = hdKeyDataSource;

  final Store _store;
  final EntropyDataSource _entropyDataSource;
  final HDKeyDataSource _hdKeyDataSource;

  @override
  TaskEither<ExceptionWithStackTrace, Uint8List> store({
    required Uint8List entropy,
  }) => TaskEither<ExceptionWithStackTrace, Uint8List>(() async {
    if (entropy.isEmpty) {
      throw ArgumentError.value(
        entropy,
        'entropy',
        'Entropy must not be empty',
      );
    }

    try {
      final Uint8List hash = computeSha256Hash(entropy);

      final Either<ExceptionWithStackTrace, Unit> result =
          await _entropyDataSource.store(hash: hash, entropy: entropy).run();

      return result.fold(left, (_) => right(hash));
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Option<Uint8List>> get({
    required Uint8List hash,
  }) => TaskEither<ExceptionWithStackTrace, Option<Uint8List>>(() async {
    try {
      return _entropyDataSource.get(hash: hash).run();
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, bool> has({required Uint8List hash}) =>
      TaskEither<ExceptionWithStackTrace, bool>(() async {
        try {
          return await _entropyDataSource.has(hash: hash).run();
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> delete({required Uint8List hash}) =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          final IOEither<ExceptionWithStackTrace, bool> checkKeyUsage =
              IOEither<ExceptionWithStackTrace, bool>(() {
                final Either<ExceptionWithStackTrace, Set<HDKeyLocalModel>>
                hdKeysResult =
                    _hdKeyDataSource.getByEntropy(entropyHash: hash).run();

                if (hdKeysResult.isLeft()) {
                  return left(hdKeysResult.getLeft().toNullable()!);
                }

                return right(hdKeysResult.getRight().toNullable()!.isNotEmpty);
              });

          final Either<ExceptionWithStackTrace, bool> keyUsageResult =
              await runInsideTransaction(
                TxMode.read,
                checkKeyUsage,
              ).run(_store);

          if (keyUsageResult.isLeft()) {
            return left(keyUsageResult.getLeft().toNullable()!);
          }

          final bool entropyInUse = keyUsageResult.getRight().toNullable()!;
          if (entropyInUse) {
            throw StateError('Cannot delete: entropy is used in HD derivation');
          }

          return await _entropyDataSource.delete(hash: hash).run();
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> deleteMany({
    required Set<Uint8List> hashes,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    if (hashes.isEmpty) {
      return right(unit);
    }

    try {
      final IOEither<ExceptionWithStackTrace, bool> checkEntropyInUse =
          IOEither<ExceptionWithStackTrace, bool>(() {
            bool entropyInUse = false;
            for (final Uint8List hash in hashes) {
              final Either<ExceptionWithStackTrace, Set<HDKeyLocalModel>>
              hdKeysResult =
                  _hdKeyDataSource.getByEntropy(entropyHash: hash).run();

              if (hdKeysResult.isLeft()) {
                return left(hdKeysResult.getLeft().toNullable()!);
              }

              if (hdKeysResult.getRight().toNullable()!.isNotEmpty) {
                entropyInUse = true;
                break;
              }
            }
            return right(entropyInUse);
          });

      final Either<ExceptionWithStackTrace, bool> entropyInUseResult =
          await runInsideTransaction(
            TxMode.read,
            checkEntropyInUse,
          ).run(_store);

      if (entropyInUseResult.isLeft()) {
        return left(entropyInUseResult.getLeft().toNullable()!);
      }

      final bool entropyInUse = entropyInUseResult.getRight().toNullable()!;
      if (entropyInUse) {
        throw StateError('Cannot delete: entropy is used in HD derivation');
      }

      return _entropyDataSource.deleteMany(hashes: hashes).run();
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, int> count() =>
      TaskEither<ExceptionWithStackTrace, int>(() async {
        try {
          return await _entropyDataSource.count().run();
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, Set<Uint8List>> getAllHashes() =>
      TaskEither<ExceptionWithStackTrace, Set<Uint8List>>(() async {
        try {
          return await _entropyDataSource.getAllHashes().run();
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> clear() =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          final Either<ExceptionWithStackTrace, Set<Uint8List>> hashesResult =
              await getAllHashes().run();

          if (hashesResult.isLeft()) {
            return left(hashesResult.getLeft().toNullable()!);
          }

          final Set<Uint8List> hashes = hashesResult.getRight().toNullable()!;

          if (hashes.isEmpty) {
            return right(unit);
          }

          final IOEither<ExceptionWithStackTrace, bool> checkEntropyUsage =
              IOEither<ExceptionWithStackTrace, bool>(() {
                bool entropyInUse = false;
                for (final Uint8List hash in hashes) {
                  final Either<ExceptionWithStackTrace, Set<HDKeyLocalModel>>
                  hdKeysResult =
                      _hdKeyDataSource.getByEntropy(entropyHash: hash).run();

                  if (hdKeysResult.isLeft()) {
                    return left(hdKeysResult.getLeft().toNullable()!);
                  }

                  if (hdKeysResult.getRight().toNullable()!.isNotEmpty) {
                    entropyInUse = true;
                    break;
                  }
                }
                return right(entropyInUse);
              });

          final Either<ExceptionWithStackTrace, bool> entropyUsageResult =
              await runInsideTransaction(
                TxMode.read,
                checkEntropyUsage,
              ).run(_store);

          if (entropyUsageResult.isLeft()) {
            return left(entropyUsageResult.getLeft().toNullable()!);
          }

          final bool entropyInUse = entropyUsageResult.getRight().toNullable()!;
          if (entropyInUse) {
            throw StateError('Cannot clear: entropy is used in HD derivation');
          }

          return _entropyDataSource.clear().run();
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });
}
