import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../models/local/account_metadata_local_model.dart';

class AccountMetadataDataSource {
  AccountMetadataDataSource({required Box<AccountMetadataLocalModel> box})
      : _box = box;
  final Box<AccountMetadataLocalModel> _box;

  AccountMetadataLocalModel store({
    required String label,
    required String iconUri,
    required Uint8List accountAddress,
  }) {
    if (getByAddress(accountAddress: accountAddress) != null) {
      throw StateError('Account address already exists');
    }

    if (getByLabel(label: label) != null) {
      throw StateError('Label already exists');
    }

    final AccountMetadataLocalModel model = AccountMetadataLocalModel(
      label: label,
      iconUri: iconUri,
      accountAddress: accountAddress,
    );
    _box.put(model);
    return model;
  }

  AccountMetadataLocalModel? getByAddress({
    required Uint8List accountAddress,
  }) =>
      _box
          .query(
            AccountMetadataLocalModel_.accountAddress.equals(accountAddress),
          )
          .build()
          .findFirst();

  AccountMetadataLocalModel? getByLabel({required String label}) => _box
      .query(AccountMetadataLocalModel_.label.equals(label))
      .build()
      .findFirst();

  AccountMetadataLocalModel? get({required int localId}) => _box.get(localId);

  List<AccountMetadataLocalModel> getAll() => _box.getAll();

  bool delete({required int localId}) => _box.remove(localId);

  bool deleteByAddress({required Uint8List accountAddress}) {
    final AccountMetadataLocalModel? metadata =
        getByAddress(accountAddress: accountAddress);
    return metadata != null && delete(localId: metadata.localId);
  }

  bool deleteByLabel({required String label}) {
    final AccountMetadataLocalModel? metadata = getByLabel(label: label);
    return metadata != null && delete(localId: metadata.localId);
  }

  int deleteMany({required List<int> localIds}) => _box.removeMany(localIds);

  int clear() => _box.removeAll();

  int count() => _box.count();

  bool update({
    required int localId,
    String? label,
    String? iconUri,
  }) {
    final AccountMetadataLocalModel? existing = get(localId: localId);
    if (existing == null) {
      return false;
    }

    if (label != null && label != existing.label) {
      final AccountMetadataLocalModel? existingLabel = getByLabel(label: label);
      if (existingLabel != null && existingLabel.localId != localId) {
        throw StateError('Label already exists');
      }
    }

    final AccountMetadataLocalModel updated = AccountMetadataLocalModel(
      label: label ?? existing.label,
      iconUri: iconUri ?? existing.iconUri,
      accountAddress: existing.accountAddress,
    );

    _box.put(updated);
    return true;
  }
}
