import 'package:defy/core/di/providers/services/object_box_service_provider.dart';
import 'package:defy/core/di/providers/services/secure_storage_service_provider.dart';
import 'package:defy/core/di/providers/services/shared_preference_service_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart';

import '../../database/objectbox/objectbox.g.dart';

class StorageModule {
  static Future<List<Override>> initialize() async {
    final overrides = <Override>[];

    final sharedPreferences = await SharedPreferences.getInstance();
    final secureStorage = _initializeSecureStorage();
    final store = await _initializeObjectBox();

    overrides.addAll([
      sharedPreferencesInitializerProvider.overrideWithValue(sharedPreferences),
      secureStorageInitializerProvider.overrideWithValue(secureStorage),
      objectBoxDbInitializerProvider.overrideWithValue(store),
    ]);

    return overrides;
  }

  static FlutterSecureStorage _initializeSecureStorage() {
    return FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
        preferencesKeyPrefix: 'id.avex.defy.securestorage',
        resetOnError: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
        accountName: 'id.avex.defy.keychain',
        synchronizable: false,
      ),
    );
  }

  static Future<Store> _initializeObjectBox() async {
    final applicationDirectory = await getApplicationDocumentsDirectory();
    final store = openStore(
      directory: join(applicationDirectory.path, "obx-defy"),
    );
    return store;
  }
}
