import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../core/di/providers/services/object_box_service_provider.dart';
import '../../../../core/di/providers/services/secure_storage_service_provider.dart';
import '../../../../core/services/secure_storage_service.dart';
import '../../data/repositories/aptos_account_repository_implementation.dart';
import '../../data/repositories/entropy_repository_implementation.dart';
import '../../data/repositories/jwk_repository_implementation.dart';
import '../../data/repositories/private_jwk_repository_implementation.dart';
import '../../data/sources/local/aptos_account_local_data_source.dart';
import '../../data/sources/local/auth_key_config_local_data_source.dart';
import '../../data/sources/local/entropy_local_data_source.dart';
import '../../data/sources/local/hd_key_local_data_source.dart';
import '../../data/sources/local/jwk_local_data_source.dart';
import '../../data/sources/local/private_jwk_local_data_source.dart';
import '../../data/sources/local/signing_key_local_data_source.dart';
import '../../domain/usecases/aptos_account_usecase.dart';
import '../../domain/usecases/mnemonic_usecase.dart';
import '../../domain/usecases/private_key_usecase.dart';

part 'generated/account_usecase_provider.g.dart';

@riverpod
EntropyRepository entropyRepository(Ref ref) {
  final SecureStorageService secureStorage =
      ref.read(secureStorageServiceProvider);
  final Store objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final EntropyDataSource entropyDataSource =
      EntropyDataSource(secureStorage: secureStorage);
  final HDKeyDataSource hdKeyDataSource =
      HDKeyDataSource(box: objectBoxStore.box());

  return EntropyRepository(
    store: objectBoxStore,
    entropyDataSource: entropyDataSource,
    hdKeyDataSource: hdKeyDataSource,
  );
}

@riverpod
PrivateJwkRepository privateJwkRepository(Ref ref) {
  final SecureStorageService secureStorage =
      ref.read(secureStorageServiceProvider);
  final Store objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final PrivateJwkDataSource privateJwkDataSource =
      PrivateJwkDataSource(secureStorage: secureStorage);
  final SigningKeyDataSource signingKeyDataSource =
      SigningKeyDataSource(box: objectBoxStore.box());

  return PrivateJwkRepository(
    store: objectBoxStore,
    signingKeyDataSource: signingKeyDataSource,
    privateJwkDataSource: privateJwkDataSource,
  );
}

@riverpod
JwkRepository jwkRepository(Ref ref) {
  final SecureStorageService secureStorage =
      ref.read(secureStorageServiceProvider);
  final Store objectBoxStore = ref.read(objectBoxDbServiceProvider);

  final JwkDataSource jwkDataSource = JwkDataSource(box: objectBoxStore.box());
  final HDKeyDataSource hdKeyDataSource =
      HDKeyDataSource(box: objectBoxStore.box());
  final SigningKeyDataSource signingKeyDataSource =
      SigningKeyDataSource(box: objectBoxStore.box());
  final Ed25519AuthKeyConfigDataSource ed25519AuthKeyConfigDataSource =
      Ed25519AuthKeyConfigDataSource(box: objectBoxStore.box());
  final EntropyDataSource entropyDataSource =
      EntropyDataSource(secureStorage: secureStorage);
  final PrivateJwkDataSource privateJwkDataSource =
      PrivateJwkDataSource(secureStorage: secureStorage);

  return JwkRepository(
    store: objectBoxStore,
    ed25519AuthKeyConfigDataSource: ed25519AuthKeyConfigDataSource,
    entropyDataSource: entropyDataSource,
    hdKeyDataSource: hdKeyDataSource,
    jwkDataSource: jwkDataSource,
    privateJwkDataSource: privateJwkDataSource,
    signingKeyDataSource: signingKeyDataSource,
  );
}

@riverpod
AptosAccountRepository aptosAccountRepository(Ref ref) {
  final Store objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final JwkDataSource jwkDataSource = JwkDataSource(box: objectBoxStore.box());
  final Ed25519AuthKeyConfigDataSource ed25519ConfigDataSource =
      Ed25519AuthKeyConfigDataSource(box: objectBoxStore.box());
  final AptosAccountDataSource aptosAccountDataSource =
      AptosAccountDataSource(box: objectBoxStore.box());

  return AptosAccountRepository(
    store: objectBoxStore,
    accountDataSource: aptosAccountDataSource,
    jwkDataSource: jwkDataSource,
    ed25519ConfigDataSource: ed25519ConfigDataSource,
  );
}

@riverpod
GenerateMnemonicUseCase generateMnemonicUseCase(Ref ref) =>
    GenerateMnemonicUseCase(repository: ref.read(entropyRepositoryProvider));

@riverpod
ImportMnemonicUseCase importMnemonicUseCase(Ref ref) =>
    ImportMnemonicUseCase(repository: ref.read(entropyRepositoryProvider));

@riverpod
ReadMnemonicUseCase readMnemonicUseCase(Ref ref) =>
    ReadMnemonicUseCase(repository: ref.read(entropyRepositoryProvider));

@riverpod
GetMnemonicAccountsUseCase getMnemonicAccountsUseCase(Ref ref) =>
    GetMnemonicAccountsUseCase(
      entropyRepository: ref.read(entropyRepositoryProvider),
      jwkRepository: ref.read(jwkRepositoryProvider),
      accountRepository: ref.read(aptosAccountRepositoryProvider),
    );

@riverpod
ImportPrivateKeyUseCase importPrivateKeyUseCase(Ref ref) =>
    ImportPrivateKeyUseCase(
      privateJwkRepository: ref.read(privateJwkRepositoryProvider),
      jwkRepository: ref.read(jwkRepositoryProvider),
    );

@riverpod
ReadPrivateKeyUseCase readPrivateKeyUseCase(Ref ref) =>
    ReadPrivateKeyUseCase(repository: ref.read(privateJwkRepositoryProvider));

@riverpod
GeneratePrivateKeyUseCase generatePrivateKeyUseCase(Ref ref) =>
    GeneratePrivateKeyUseCase(
      entropyRepository: ref.read(entropyRepositoryProvider),
      jwkRepository: ref.read(jwkRepositoryProvider),
    );

@riverpod
CreateAptosAccountUseCase createAptosAccountUseCase(Ref ref) =>
    CreateAptosAccountUseCase(
        repository: ref.read(aptosAccountRepositoryProvider));

@riverpod
DeleteAptosAccountUseCase deleteAptosAccountUseCase(Ref ref) =>
    DeleteAptosAccountUseCase(
        repository: ref.read(aptosAccountRepositoryProvider));

@riverpod
GetAptosAccountUseCase getAptosAccountUseCase(Ref ref) =>
    GetAptosAccountUseCase(
        repository: ref.read(aptosAccountRepositoryProvider));

@riverpod
ListAptosAccountsUseCase listAptosAccountsUseCase(Ref ref) =>
    ListAptosAccountsUseCase(
        repository: ref.read(aptosAccountRepositoryProvider));

@riverpod
RevealAccountPublicKeyUseCase revealAccountPublicKeyUseCase(Ref ref) =>
    RevealAccountPublicKeyUseCase(
      accountRepository: ref.read(aptosAccountRepositoryProvider),
      jwkRepository: ref.read(jwkRepositoryProvider),
    );

@riverpod
RevealAccountPrivateKeyUseCase revealAccountPrivateKeyUseCase(Ref ref) =>
    RevealAccountPrivateKeyUseCase(
      accountRepository: ref.read(aptosAccountRepositoryProvider),
      jwkRepository: ref.read(jwkRepositoryProvider),
      entropyRepository: ref.read(entropyRepositoryProvider),
      privateJwkRepository: ref.read(privateJwkRepositoryProvider),
    );

@riverpod
RevealAccountMnemonicUseCase revealAccountMnemonicUseCase(Ref ref) =>
    RevealAccountMnemonicUseCase(
      accountRepository: ref.read(aptosAccountRepositoryProvider),
      jwkRepository: ref.read(jwkRepositoryProvider),
      entropyRepository: ref.read(entropyRepositoryProvider),
    );

@riverpod
CanRevealMnemonicUseCase canRevealMnemonicUseCase(Ref ref) =>
    CanRevealMnemonicUseCase(
      accountRepository: ref.read(aptosAccountRepositoryProvider),
      jwkRepository: ref.read(jwkRepositoryProvider),
    );
