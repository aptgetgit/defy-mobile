import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../core/di/providers/services/object_box_service_provider.dart';
import '../../../../core/di/providers/services/secure_storage_service_provider.dart';
import '../../../../core/services/secure_storage_service.dart';
import '../../data/repositories/aptos_account_repository_implementation.dart';
import '../../data/repositories/entropy_repository_implementation.dart';
import '../../data/repositories/private_key_repository_implementation.dart';
import '../../data/repositories/public_key_repository_implementation.dart';
import '../../data/sources/local/aptos_account_local_data_source.dart';
import '../../data/sources/local/public_key_local_data_source.dart';
import '../../domain/usecases/aptos_account_usecase.dart';
import '../../domain/usecases/mnemonic_usecase.dart';
import '../../domain/usecases/private_key_usecase.dart';

part 'generated/account_usecase_provider.g.dart';

@riverpod
EntropyRepository entropyRepository(Ref ref) {
  final SecureStorageService secureStorage =
      ref.read(secureStorageServiceProvider);
  return EntropyRepository(secureStorage);
}

@riverpod
PrivateKeyRepository privateKeyRepository(Ref ref) {
  final SecureStorageService secureStorage =
      ref.read(secureStorageServiceProvider);
  return PrivateKeyRepository(secureStorage);
}

@riverpod
PublicKeyRepository publicKeyRepository(Ref ref) {
  final Store objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final PublicKeyLocalDataSource localDataSource =
      PublicKeyLocalDataSource(objectBoxStore);
  return PublicKeyRepository(localDataSource);
}

@riverpod
AptosAccountRepository aptosAccountRepository(Ref ref) {
  final Store objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final AptosAccountLocalDataSource localDataSource =
      AptosAccountLocalDataSource(objectBoxStore);
  final PublicKeyLocalDataSource publicKeyDataSource =
      PublicKeyLocalDataSource(objectBoxStore);
  return AptosAccountRepository(localDataSource, publicKeyDataSource);
}

@riverpod
GenerateMnemonicUseCase generateMnemonicUseCase(Ref ref) {
  final EntropyRepository repository = ref.read(entropyRepositoryProvider);
  return GenerateMnemonicUseCase(repository);
}

@riverpod
ImportMnemonicUseCase importMnemonicUseCase(Ref ref) {
  final EntropyRepository repository = ref.read(entropyRepositoryProvider);
  return ImportMnemonicUseCase(repository);
}

// @riverpod
// RemoveMnemonicUseCase removeMnemonicUseCase(Ref ref) {
//   final EntropyRepository repository = ref.read(entropyRepositoryProvider);
//   return RemoveMnemonicUseCase(repository);
// }

@riverpod
ReadMnemonicUseCase readMnemonicUseCase(Ref ref) {
  final EntropyRepository repository = ref.read(entropyRepositoryProvider);
  return ReadMnemonicUseCase(repository);
}

// Private Key UseCase Providers
@riverpod
ImportPrivateKeyUseCase importPrivateKeyUseCase(Ref ref) {
  final PrivateKeyRepository privateKeyRepo =
      ref.read(privateKeyRepositoryProvider);
  final PublicKeyRepository publicKeyRepo =
      ref.read(publicKeyRepositoryProvider);
  return ImportPrivateKeyUseCase(privateKeyRepo, publicKeyRepo);
}

// @riverpod
// RemovePrivateKeyUseCase removePrivateKeyUseCase(Ref ref) {
//   final PrivateKeyRepository privateKeyRepo =
//       ref.read(privateKeyRepositoryProvider);
//   final PublicKeyRepository publicKeyRepo =
//       ref.read(publicKeyRepositoryProvider);
//   return RemovePrivateKeyUseCase(privateKeyRepo, publicKeyRepo);
// }

@riverpod
ReadPrivateKeyUseCase readPrivateKeyUseCase(Ref ref) {
  final PrivateKeyRepository repository =
      ref.read(privateKeyRepositoryProvider);
  return ReadPrivateKeyUseCase(repository);
}

@riverpod
GeneratePrivateKeyUseCase generatePrivateKeyUseCase(Ref ref) {
  final EntropyRepository entropyRepo = ref.read(entropyRepositoryProvider);
  final PrivateKeyRepository privateKeyRepo =
      ref.read(privateKeyRepositoryProvider);
  final PublicKeyRepository publicKeyRepo =
      ref.read(publicKeyRepositoryProvider);
  return GeneratePrivateKeyUseCase(
    entropyRepo,
    privateKeyRepo,
    publicKeyRepo,
  );
}

// Aptos Account UseCase Providers
@riverpod
CreateAptosAccountUseCase createAptosAccountUseCase(Ref ref) {
  final AptosAccountRepository repository =
      ref.read(aptosAccountRepositoryProvider);
  return CreateAptosAccountUseCase(repository);
}

// @riverpod
// DeleteAptosAccountUseCase deleteAptosAccountUseCase(Ref ref) {
//   final AptosAccountRepository repository =
//       ref.read(aptosAccountRepositoryProvider);
//   return DeleteAptosAccountUseCase(repository);
// }

@riverpod
GetAptosAccountUseCase getAptosAccountUseCase(Ref ref) {
  final AptosAccountRepository repository =
      ref.read(aptosAccountRepositoryProvider);
  return GetAptosAccountUseCase(repository);
}

@riverpod
ListAptosAccountsUseCase listAptosAccountsUseCase(Ref ref) {
  final AptosAccountRepository repository =
      ref.read(aptosAccountRepositoryProvider);
  return ListAptosAccountsUseCase(repository);
}
