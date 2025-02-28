import 'dart:typed_data';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../models/local/aptos_account_local_model.dart';

class AptosAccountLocalDataSource {
  AptosAccountLocalDataSource({required Box<AptosAccountLocalModel> box})
      : _box = box;
  final Box<AptosAccountLocalModel> _box;

  AptosAccountLocalModel store({
    required Uint8List accountAddress,
    required Uint8List authenticationKey,
    required int authenticationKeyScheme,
  }) {
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
      final AptosAccountLocalModel? existingAccount =
          getByAddress(accountAddress: accountAddress);
      if (existingAccount != null) {
        throw StateError('Account with this address already exists');
      }

      final AptosAccountLocalModel model = AptosAccountLocalModel(
        accountAddress: accountAddress,
        authenticationKey: authenticationKey,
        authenticationKeyScheme: authenticationKeyScheme,
      );

      _box.put(model, mode: PutMode.insert);
      AppLogger.debug('Stored aptos account: $model');
      return model;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to store aptos account',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Unexpected error while storing Aptos account: $e');
    }
  }

  AptosAccountLocalModel? getByAddress({required Uint8List accountAddress}) {
    if (accountAddress.length != 32) {
      throw ArgumentError.value(
        accountAddress,
        'accountAddress',
        'Account address must be exactly 32 bytes in length',
      );
    }

    try {
      return _box
          .query(AptosAccountLocalModel_.accountAddress.equals(accountAddress))
          .build()
          .findFirst();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve Aptos account by address',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve Aptos account by address: $e');
    }
  }

  AptosAccountLocalModel? get({required int localId}) {
    if (localId <= 0) {
      throw ArgumentError.value(
        localId,
        'localId',
        'Local ID must be a positive integer',
      );
    }

    try {
      return _box.get(localId);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve Aptos account',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve Aptos account with ID $localId: $e');
    }
  }

  Set<AptosAccountLocalModel> getByAuthKey({
    required Uint8List authenticationKey,
  }) {
    if (authenticationKey.length != 32) {
      throw ArgumentError.value(
        authenticationKey,
        'authenticationKey',
        'Authentication key must be exactly 32 bytes in length',
      );
    }

    try {
      return _box
          .query(
            AptosAccountLocalModel_.authenticationKey.equals(authenticationKey),
          )
          .build()
          .find().toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve Aptos accounts by authentication key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception(
          'Failed to retrieve Aptos accounts by authentication key: $e');
    }
  }

  Set<AptosAccountLocalModel> getByScheme({
    required int authenticationKeyScheme,
  }) {
    if (authenticationKeyScheme < 0 || authenticationKeyScheme > 3) {
      throw ArgumentError.value(
        authenticationKeyScheme,
        'authenticationKeyScheme',
        'Authentication key scheme must be one of the valid values: 0, 1, 2, or 3',
      );
    }

    try {
      return _box
          .query(
            AptosAccountLocalModel_.authenticationKeyScheme
                .equals(authenticationKeyScheme),
          )
          .build()
          .find().toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve Aptos accounts by scheme',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve Aptos accounts by scheme: $e');
    }
  }

  Set<AptosAccountLocalModel> getAll() {
    try {
      return _box.getAll().toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve all Aptos accounts',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve all Aptos accounts: $e');
    }
  }

  void delete({required int localId}) {
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
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete Aptos account',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error while deleting Aptos account: $e');
    }
  }

  void deleteMany({required Set<int> localIds}) {
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
      final int deletedCount = _box.removeMany(localIds.toList());
      if (deletedCount != localIds.length) {
        throw StateError(
          'Failed to delete all specified accounts: only deleted $deletedCount out of ${localIds.length}',
        );
      }
      AppLogger.debug('Deleted $deletedCount aptos accounts');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete multiple Aptos accounts',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error while deleting multiple Aptos accounts: $e');
    }
  }

  void deleteByAddress({required Uint8List accountAddress}) {
    if (accountAddress.length != 32) {
      throw ArgumentError.value(
        accountAddress,
        'accountAddress',
        'Account address must be exactly 32 bytes in length',
      );
    }

    try {
      final AptosAccountLocalModel? account =
          getByAddress(accountAddress: accountAddress);
      if (account == null) {
        throw StateError('Aptos account not found with the specified address');
      }

      delete(localId: account.localId);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete Aptos account by address',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete Aptos account by address: $e');
    }
  }

  void deleteByAuthKey({required Uint8List authenticationKey}) {
    if (authenticationKey.length != 32) {
      throw ArgumentError.value(
        authenticationKey,
        'authenticationKey',
        'Authentication key must be exactly 32 bytes in length',
      );
    }

    try {
      final Set<AptosAccountLocalModel> accounts =
          getByAuthKey(authenticationKey: authenticationKey);
      if (accounts.isEmpty) {
        throw StateError(
            'No Aptos accounts found with the specified authentication key');
      }

      final Set<int> idsToDelete =
          accounts.map((AptosAccountLocalModel acc) => acc.localId).toSet();

      deleteMany(localIds: idsToDelete);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete Aptos accounts by authentication key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception(
          'Failed to delete Aptos accounts by authentication key: $e');
    }
  }

  void deleteByScheme({required int authenticationKeyScheme}) {
    if (authenticationKeyScheme < 0 || authenticationKeyScheme > 3) {
      throw ArgumentError.value(
        authenticationKeyScheme,
        'authenticationKeyScheme',
        'Authentication key scheme must be one of the valid values: 0, 1, 2, or 3',
      );
    }

    try {
      final Set<AptosAccountLocalModel> accounts =
          getByScheme(authenticationKeyScheme: authenticationKeyScheme);
      if (accounts.isEmpty) {
        throw StateError(
            'No Aptos accounts found with the specified authentication key scheme');
      }

      final Set<int> idsToDelete =
          accounts.map((AptosAccountLocalModel acc) => acc.localId).toSet();

      deleteMany(localIds: idsToDelete);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete Aptos accounts by scheme',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete Aptos accounts by scheme: $e');
    }
  }

  void clear() {
    try {
      _box.removeAll();
      AppLogger.debug('Cleared all Aptos accounts');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to clear all Aptos accounts',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to clear all Aptos accounts: $e');
    }
  }

  int count() {
    try {
      return _box.count();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to count Aptos accounts',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to count Aptos accounts: $e');
    }
  }
}
