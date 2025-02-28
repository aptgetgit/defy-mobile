import 'dart:typed_data';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../models/local/account_metadata_local_model.dart';

class AccountMetadataLocalDataSource {
  AccountMetadataLocalDataSource({required Box<AccountMetadataLocalModel> box})
      : _box = box;
  final Box<AccountMetadataLocalModel> _box;

  AccountMetadataLocalModel store({
    required String label,
    required String iconUri,
    required int backgroundColor,
    required Uint8List accountAddress,
  }) {
    if (label.trim().isEmpty) {
      throw ArgumentError.value(
        label,
        'label',
        'Account label cannot be empty',
      );
    }
    if (iconUri.trim().isEmpty) {
      throw ArgumentError.value(
        iconUri,
        'iconUri',
        'Account icon URI cannot be empty',
      );
    }
    if (backgroundColor < 0 || backgroundColor > 0xFFFFFFFF) {
      throw ArgumentError.value(
        backgroundColor,
        'backgroundColor',
        'Background color must be a valid ARGB color value (0x00000000 to 0xFFFFFFFF)',
      );
    }
    if (accountAddress.length != 32) {
      throw ArgumentError.value(
        accountAddress,
        'accountAddress',
        'Account address must be exactly 32 bytes in length',
      );
    }
    try {
      final AccountMetadataLocalModel? existingAccount =
          getByAddress(accountAddress: accountAddress);
      if (existingAccount != null) {
        throw StateError('Account with this address already exists');
      }

      final AccountMetadataLocalModel? existingLabel = getByLabel(label: label);
      if (existingLabel != null) {
        throw StateError('Account with label "$label" already exists');
      }

      final AccountMetadataLocalModel model = AccountMetadataLocalModel(
        label: label.trim(),
        iconUri: iconUri.trim(),
        backgroundColor: backgroundColor,
        accountAddress: accountAddress,
      );

      _box.put(model, mode: PutMode.insert);
      AppLogger.debug('Stored account metadata: $model');
      return model;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to store account metadata',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Unexpected error while storing account: $e');
    }
  }

  AccountMetadataLocalModel? getByAddress({
    required Uint8List accountAddress,
  }) {
    if (accountAddress.length != 32) {
      throw ArgumentError.value(
        accountAddress,
        'accountAddress',
        'Account address must be exactly 32 bytes in length',
      );
    }

    try {
      return _box
          .query(
            AccountMetadataLocalModel_.accountAddress.equals(accountAddress),
          )
          .build()
          .findFirst();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve account by address',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve account by address: $e');
    }
  }

  AccountMetadataLocalModel? getByLabel({
    required String label,
  }) {
    if (label.trim().isEmpty) {
      throw ArgumentError.value(
        label,
        'label',
        'Account label cannot be empty',
      );
    }

    try {
      return _box
          .query(AccountMetadataLocalModel_.label.equals(label))
          .build()
          .findFirst();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve account by label',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve account by label: $e');
    }
  }

  AccountMetadataLocalModel? get({required int localId}) {
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
        'Failed to retrieve account with ID $localId',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve account with ID $localId: $e');
    }
  }

  Set<AccountMetadataLocalModel> getAll() {
    try {
      return _box.getAll().toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve all accounts',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve all accounts: $e');
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
        throw StateError('Account with local ID: $localId not found');
      }
      AppLogger.debug('Deleted account with ID: $localId');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete account with ID $localId',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error while deleting account: $e');
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
      final AccountMetadataLocalModel? metadata =
          getByAddress(accountAddress: accountAddress);

      if (metadata == null) {
        throw StateError('Account not found with the specified address');
      }
      delete(localId: metadata.localId);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete account by address',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete account by address: $e');
    }
  }

  void deleteByLabel({required String label}) {
    if (label.trim().isEmpty) {
      throw ArgumentError.value(
        label,
        'label',
        'Account label cannot be empty',
      );
    }

    try {
      final AccountMetadataLocalModel? metadata = getByLabel(label: label);

      if (metadata == null) {
        throw StateError('Account not found with label: $label');
      }

      delete(localId: metadata.localId);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete account by label',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete account by label: $e');
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
      AppLogger.debug('Deleted multiple accounts: $localIds');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete multiple accounts',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error while deleting multiple accounts: $e');
    }
  }

  void clear() {
    try {
      _box.removeAll();
      AppLogger.debug('Cleared all accounts');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to clear all accounts',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to clear all accounts: $e');
    }
  }

  int count() {
    try {
      return _box.count();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to count accounts',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to count accounts: $e');
    }
  }

  void update({
    required int localId,
    String? label,
    String? iconUri,
    int? backgroundColor,
  }) {
    if (localId <= 0) {
      throw ArgumentError.value(
        localId,
        'localId',
        'Local ID must be a positive integer',
      );
    }

    if (label != null && label.trim().isEmpty) {
      throw ArgumentError.value(
        label,
        'label',
        'Account label cannot be empty',
      );
    }

    if (iconUri != null && iconUri.trim().isEmpty) {
      throw ArgumentError.value(
        iconUri,
        'iconUri',
        'Account icon URI cannot be empty',
      );
    }

    if (backgroundColor != null &&
        (backgroundColor < 0 || backgroundColor > 0xFFFFFFFF)) {
      throw ArgumentError.value(
        backgroundColor,
        'backgroundColor',
        'Background color must be a valid ARGB color value (0x00000000 to 0xFFFFFFFF)',
      );
    }

    final AccountMetadataLocalModel? existing = get(localId: localId);
    if (existing == null) {
      throw StateError('Account with local ID: $localId not found');
    }

    if (label != null && label != existing.label) {
      final AccountMetadataLocalModel? existingLabel = getByLabel(label: label);
      if (existingLabel != null && existingLabel.localId != localId) {
        throw StateError('Label already exists');
      }
    }
    try {
      final AccountMetadataLocalModel updated = AccountMetadataLocalModel(
        label: label ?? existing.label,
        iconUri: iconUri ?? existing.iconUri,
        backgroundColor: backgroundColor ?? existing.backgroundColor,
        accountAddress: existing.accountAddress,
      );

      _box.put(updated, mode: PutMode.update);
      AppLogger.debug('Updated account with ID: $localId');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to update account with ID $localId',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error while updating account: $e');
    }
  }
}
