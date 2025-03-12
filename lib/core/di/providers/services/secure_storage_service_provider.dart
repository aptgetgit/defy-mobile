import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/secure_storage_service.dart';
import '../storage/secure_storage_provider.dart';

part 'generated/secure_storage_service_provider.g.dart';

@Riverpod(keepAlive: true)
SecureStorageService secureStorageService(Ref ref) =>
    SecureStorageService(ref.watch(secureStorageProvider));
