
import 'package:defy/features/shared/data/repositories/mnemonic_repository_implementation.dart';
import 'package:defy/features/shared/domain/usecases/mnemonic_usercase.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/dio/providers/services/secure_storage_service_provider.dart';
import '../../../../core/services/secure_storage_service.dart';

part 'generated/mnemonic_usecase_provider.g.dart';

@riverpod
MnemonicRepository mnemonicRepository(Ref ref) {
  final SecureStorageService secureStorageService = ref.read(secureStorageServiceProvider);
  return MnemonicRepository(secureStorageService);
}

@riverpod
GenerateMnemonicUseCase generateMnemonicUseCase(Ref ref) {
  final MnemonicRepository repository = ref.read(mnemonicRepositoryProvider);
  return GenerateMnemonicUseCase(repository);
}

@riverpod
ValidateMnemonicUseCase validateMnemonicUseCase(Ref ref) {
  final MnemonicRepository repository = ref.read(mnemonicRepositoryProvider);
  return ValidateMnemonicUseCase(repository);
}

@riverpod
ToSeedUseCase toSeedUseCase(Ref ref) {
  final MnemonicRepository repository = ref.read(mnemonicRepositoryProvider);
  return ToSeedUseCase(repository);
}

@riverpod
ToSeedHexUseCase toSeedHexUseCase(Ref ref) {
  final MnemonicRepository repository = ref.read(mnemonicRepositoryProvider);
  return ToSeedHexUseCase(repository);
}

@riverpod
SaveMnemonicUseCase saveMnemonicUseCase(Ref ref) {
  final MnemonicRepository repository = ref.read(mnemonicRepositoryProvider);
  return SaveMnemonicUseCase(repository);
}

@riverpod
GetMnemonicUseCase getMnemonicUseCase(Ref ref) {
  final MnemonicRepository repository = ref.read(mnemonicRepositoryProvider);
  return GetMnemonicUseCase(repository);
}

@riverpod
DeleteMnemonicUseCase deleteMnemonicUseCase(Ref ref) {
  final MnemonicRepository repository = ref.read(mnemonicRepositoryProvider);
  return DeleteMnemonicUseCase(repository);
}