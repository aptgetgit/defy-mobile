import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constant/secure_storage_constant.dart';

part 'generated/secure_storage_provider.g.dart';

@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) => const FlutterSecureStorage(
  aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
    preferencesKeyPrefix: SecureStorageConstant.preferencesKeyPrefix,
    sharedPreferencesName: SecureStorageConstant.sharedPreferencesName,
    resetOnError: true,
    keyCipherAlgorithm:
        KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
    storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
  ),
  iOptions: IOSOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
    accountName: SecureStorageConstant.iosAccountName,
    groupId: null,
    synchronizable: true,
  ),
);
