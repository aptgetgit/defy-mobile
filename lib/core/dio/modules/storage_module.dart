import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../database/objectbox/objectbox.g.dart';
import '../providers/services/object_box_service_provider.dart';
import '../providers/services/secure_storage_service_provider.dart';
import '../providers/services/shared_preference_service_provider.dart';

Future<List<Override>> initializeStorageModule() async {
  final List<Override> overrides = <Override>[];
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final FlutterSecureStorage secureStorage = _initializeSecureStorage();
  final Store store = await _initializeObjectBox();

  overrides.addAll(<Override>[
    sharedPreferencesInitializerProvider.overrideWithValue(sharedPreferences),
    secureStorageInitializerProvider.overrideWithValue(secureStorage),
    objectBoxDbInitializerProvider.overrideWithValue(store),
  ]);

  return overrides;
}

FlutterSecureStorage _initializeSecureStorage() => const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
        preferencesKeyPrefix: 'id.avex.defy.securestorage',
        resetOnError: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
        accountName: 'id.avex.defy.keychain',
      ),
    );

Future<Store> _initializeObjectBox() async {
  final Directory applicationDirectory =
      await getApplicationDocumentsDirectory();
  final Future<Store> store = openStore(
    directory: join(applicationDirectory.path, 'obx-defy'),
  );
  return store;
}
