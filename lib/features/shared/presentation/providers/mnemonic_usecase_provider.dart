import 'package:defy/core/providers/secure_storage_provider.dart';
import 'package:defy/features/shared/data/repositories/mnemonic_repository_implementation.dart';
import 'package:defy/features/shared/domain/usecases/mnemonic_usercase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/mnemonic_usecase_provider.g.dart';

@riverpod
MnemonicRepository mnemonicRepository(MnemonicRepositoryRef ref) {
  final secureStorageService = ref.read(secureStorageServiceProvider);
  return MnemonicRepository(secureStorageService);
}

@riverpod
GenerateMnemonicUseCase generateMnemonicUseCase(GenerateMnemonicUseCaseRef ref) {
  final repository = ref.read(mnemonicRepositoryProvider);
  return GenerateMnemonicUseCase(repository);
}

@riverpod
ValidateMnemonicUseCase validateMnemonicUseCase(ValidateMnemonicUseCaseRef ref) {
  final repository = ref.read(mnemonicRepositoryProvider);
  return ValidateMnemonicUseCase(repository);
}

@riverpod
ToSeedUseCase toSeedUseCase(ToSeedUseCaseRef ref) {
  final repository = ref.read(mnemonicRepositoryProvider);
  return ToSeedUseCase(repository);
}

@riverpod
ToSeedHexUseCase toSeedHexUseCase(ToSeedHexUseCaseRef ref) {
  final repository = ref.read(mnemonicRepositoryProvider);
  return ToSeedHexUseCase(repository);
}

@riverpod
SaveMnemonicUseCase saveMnemonicUseCase(SaveMnemonicUseCaseRef ref) {
  final repository = ref.read(mnemonicRepositoryProvider);
  return SaveMnemonicUseCase(repository);
}

@riverpod
GetMnemonicUseCase getMnemonicUseCase(GetMnemonicUseCaseRef ref) {
  final repository = ref.read(mnemonicRepositoryProvider);
  return GetMnemonicUseCase(repository);
}

@riverpod
DeleteMnemonicUseCase deleteMnemonicUseCase(DeleteMnemonicUseCaseRef ref) {
  final repository = ref.read(mnemonicRepositoryProvider);
  return DeleteMnemonicUseCase(repository);
}