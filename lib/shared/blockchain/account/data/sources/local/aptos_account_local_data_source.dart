import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../models/local/aptos_account_local_model.dart';

class AptosAccountLocalDataSource {
  AptosAccountLocalDataSource({required Box<AptosAccountLocalModel> box})
    : _box = box;
  final Box<AptosAccountLocalModel> _box;

  IOEither<ExceptionWithStackTrace, AptosAccountLocalModel> store({
    required Uint8List accountAddress,
    required Uint8List authenticationKey,
    required int authenticationKeyScheme,
  }) => IOEither<ExceptionWithStackTrace, AptosAccountLocalModel>(() {
    if (accountAddress.length != 32) {
      throw ArgumentError.value(
        accountAddress,
        'accountAddress',
        'Account address must be exactly 32 bytes in length',
      );
    }
    if (authenticationKey.length != 32) {
      throw ArgumentError.value(
        authenticationKey,
        'authenticationKey',
        'Authentication key must be exactly 32 bytes in length',
      );
    }
    if (authenticationKeyScheme < 0 || authenticationKeyScheme > 3) {
      throw ArgumentError.value(
        authenticationKeyScheme,
        'authenticationKeyScheme',
        'Authentication key scheme must be one of the valid values: 0, 1, 2, or 3',
      );
    }

    try {
      final Either<ExceptionWithStackTrace, Option<AptosAccountLocalModel>>
      existingAccountResult =
          getByAddress(accountAddress: accountAddress).run();

      if (existingAccountResult.isLeft()) {
        return left(existingAccountResult.getLeft().toNullable()!);
      }
      if (existingAccountResult.isRight() &&
          existingAccountResult.getRight().isSome() &&
          existingAccountResult.getRight().toNullable()!.isSome()) {
        throw StateError('Account with this address already exists');
      }

      final AptosAccountLocalModel model = AptosAccountLocalModel(
        accountAddress: accountAddress,
        authenticationKey: authenticationKey,
        authenticationKeyScheme: authenticationKeyScheme,
      );

      _box.put(model, mode: PutMode.insert);
      AppLogger.debug('Stored aptos account: $model');
      return right(model);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Option<AptosAccountLocalModel>>
  getByAddress({required Uint8List accountAddress}) =>
      IOEither<ExceptionWithStackTrace, Option<AptosAccountLocalModel>>(() {
        if (accountAddress.length != 32) {
          throw ArgumentError.value(
            accountAddress,
            'accountAddress',
            'Account address must be exactly 32 bytes in length',
          );
        }

        try {
          final AptosAccountLocalModel? account =
              _box
                  .query(
                    AptosAccountLocalModel_.accountAddress.equals(
                      accountAddress,
                    ),
                  )
                  .build()
                  .findFirst();
          return right(optionOf(account));
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Option<AptosAccountLocalModel>> get({
    required int localId,
  }) => IOEither<ExceptionWithStackTrace, Option<AptosAccountLocalModel>>(() {
    if (localId <= 0) {
      throw ArgumentError.value(
        localId,
        'localId',
        'Local ID must be a positive integer',
      );
    }

    try {
      final AptosAccountLocalModel? account = _box.get(localId);
      return right(optionOf(account));
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Set<AptosAccountLocalModel>> getByAuthKey({
    required Uint8List authenticationKey,
  }) => IOEither<ExceptionWithStackTrace, Set<AptosAccountLocalModel>>(() {
    if (authenticationKey.length != 32) {
      throw ArgumentError.value(
        authenticationKey,
        'authenticationKey',
        'Authentication key must be exactly 32 bytes in length',
      );
    }

    try {
      final Set<AptosAccountLocalModel> accounts =
          _box
              .query(
                AptosAccountLocalModel_.authenticationKey.equals(
                  authenticationKey,
                ),
              )
              .build()
              .find()
              .toSet();
      return right(accounts);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Set<AptosAccountLocalModel>> getByScheme({
    required int authenticationKeyScheme,
  }) => IOEither<ExceptionWithStackTrace, Set<AptosAccountLocalModel>>(() {
    if (authenticationKeyScheme < 0 || authenticationKeyScheme > 3) {
      throw ArgumentError.value(
        authenticationKeyScheme,
        'authenticationKeyScheme',
        'Authentication key scheme must be one of the valid values: 0, 1, 2, or 3',
      );
    }

    try {
      final Set<AptosAccountLocalModel> accounts =
          _box
              .query(
                AptosAccountLocalModel_.authenticationKeyScheme.equals(
                  authenticationKeyScheme,
                ),
              )
              .build()
              .find()
              .toSet();
      return right(accounts);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Set<AptosAccountLocalModel>> getAll() =>
      IOEither<ExceptionWithStackTrace, Set<AptosAccountLocalModel>>(() {
        try {
          return right(_box.getAll().toSet());
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Unit> delete({required int localId}) =>
      IOEither<ExceptionWithStackTrace, Unit>(() {
        if (localId <= 0) {
          throw ArgumentError.value(
            localId,
            'localId',
            'Local ID must be a positive integer',
          );
        }

        try {
          final bool success = _box.remove(localId);
          if (!success) {
            throw StateError('Aptos account with local ID: $localId not found');
          }
          AppLogger.debug('Deleted aptos account with local ID: $localId');
          return right(unit);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Unit> deleteMany({
    required Set<int> localIds,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (localIds.isEmpty) {
      throw ArgumentError.value(
        localIds,
        'localIds',
        'List of IDs cannot be empty',
      );
    }

    for (final int id in localIds) {
      if (id <= 0) {
        throw ArgumentError.value(
          id,
          'localId',
          'Each local ID must be a positive integer',
        );
      }
    }

    try {
      final List<AptosAccountLocalModel?> existingObjects = _box.getMany(
        localIds.toList(),
      );

      final Set<int> existingIds =
          existingObjects
              .map((AptosAccountLocalModel? obj) => obj?.localId ?? 0)
              .toSet();

      final Set<int> missingIds = localIds.difference(existingIds);

      if (missingIds.isNotEmpty) {
        throw StateError(
          'Aptos accounts not found with the following IDs: $missingIds',
        );
      }
      final int deletedCount = _box.removeMany(localIds.toList());
      if (deletedCount != localIds.length) {
        throw StateError(
          'Failed to delete all specified accounts: only deleted $deletedCount out of ${localIds.length}',
        );
      }
      AppLogger.debug('Deleted $deletedCount aptos accounts');
      return right(unit);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> deleteByAddress({
    required Uint8List accountAddress,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (accountAddress.length != 32) {
      throw ArgumentError.value(
        accountAddress,
        'accountAddress',
        'Account address must be exactly 32 bytes in length',
      );
    }

    try {
      final Either<ExceptionWithStackTrace, Option<AptosAccountLocalModel>>
      accountResult = getByAddress(accountAddress: accountAddress).run();

      return accountResult.fold(
        left,
        (Option<AptosAccountLocalModel> accountOption) => accountOption.fold(
          () =>
              throw StateError(
                'Aptos account not found with the specified address',
              ),
          (AptosAccountLocalModel account) =>
              delete(localId: account.localId).run(),
        ),
      );
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> deleteByAuthKey({
    required Uint8List authenticationKey,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (authenticationKey.length != 32) {
      throw ArgumentError.value(
        authenticationKey,
        'authenticationKey',
        'Authentication key must be exactly 32 bytes in length',
      );
    }

    try {
      final Either<ExceptionWithStackTrace, Set<AptosAccountLocalModel>>
      accountsResult = getByAuthKey(authenticationKey: authenticationKey).run();

      return accountsResult.fold(left, (Set<AptosAccountLocalModel> accounts) {
        if (accounts.isEmpty) {
          throw StateError(
            'No Aptos accounts found with the specified authentication key',
          );
        }

        final Set<int> idsToDelete =
            accounts.map((AptosAccountLocalModel acc) => acc.localId).toSet();

        final int deletedCount = _box.removeMany(idsToDelete.toList());

        if (deletedCount != idsToDelete.length) {
          throw StateError(
            'Failed to delete all specified accounts: only deleted $deletedCount out of ${idsToDelete.length}',
          );
        }

        return right(unit);
      });
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> deleteByScheme({
    required int authenticationKeyScheme,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (authenticationKeyScheme < 0 || authenticationKeyScheme > 3) {
      throw ArgumentError.value(
        authenticationKeyScheme,
        'authenticationKeyScheme',
        'Authentication key scheme must be one of the valid values: 0, 1, 2, or 3',
      );
    }

    try {
      final Either<ExceptionWithStackTrace, Set<AptosAccountLocalModel>>
      accountsResult =
          getByScheme(authenticationKeyScheme: authenticationKeyScheme).run();

      return accountsResult.fold(left, (Set<AptosAccountLocalModel> accounts) {
        if (accounts.isEmpty) {
          throw StateError(
            'No Aptos accounts found with the specified authentication key scheme',
          );
        }

        final Set<int> idsToDelete =
            accounts.map((AptosAccountLocalModel acc) => acc.localId).toSet();
        final int deletedCount = _box.removeMany(idsToDelete.toList());

        if (deletedCount != idsToDelete.length) {
          throw StateError(
            'Failed to delete all specified accounts: only deleted $deletedCount out of ${idsToDelete.length}',
          );
        }
        return right(unit);
      });
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> clear() =>
      IOEither<ExceptionWithStackTrace, Unit>(() {
        try {
          _box.removeAll();
          AppLogger.debug('Cleared all Aptos accounts');
          return right(unit);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, int> count() =>
      IOEither<ExceptionWithStackTrace, int>(() {
        try {
          return right(_box.count());
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });
}
