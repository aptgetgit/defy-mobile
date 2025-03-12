import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../core/di/providers/services/secure_storage_service_provider.dart';
import '../../../../../core/di/providers/services/shared_preferences_service_provider.dart';
import '../../../../../core/di/providers/storage/object_box_store_provider.dart';
import '../../../../../core/services/secure_storage_service.dart';
import '../../../../../core/services/shared_preference_service.dart';
import '../../data/repositories/active_account_repository_implementation.dart';
import '../../data/repositories/aptos_account_repository_implementation.dart';
import '../../data/repositories/entropy_repository_implementation.dart';
import '../../data/repositories/jwk_repository_implementation.dart';
import '../../data/repositories/private_jwk_repository_implementation.dart';
import '../../data/sources/local/account_metadata_local_data_source.dart';
import '../../data/sources/local/active_account_local_data_source.dart';
import '../../data/sources/local/aptos_account_local_data_source.dart';
import '../../data/sources/local/ed25519_auth_key_config_local_data_source.dart';
import '../../data/sources/local/entropy_local_data_source.dart';
import '../../data/sources/local/hd_key_local_data_source.dart';
import '../../data/sources/local/jwk_local_data_source.dart';
import '../../data/sources/local/private_jwk_local_data_source.dart';
import '../../data/sources/local/signing_key_local_data_source.dart';
import '../../domain/repositories/active_account_repository_interface.dart';
import '../../domain/repositories/aptos_account_repository_interface.dart';
import '../../domain/repositories/entropy_repository_interface.dart';
import '../../domain/repositories/jwk_repository_interface.dart';
import '../../domain/repositories/private_jwk_repository_interface.dart';
import '../../domain/usecases/check_mnemonic_availability_usecase.dart';
import '../../domain/usecases/clear_active_account_usecase.dart';
import '../../domain/usecases/create_aptos_account_usecase.dart';
import '../../domain/usecases/delete_aptos_account_usecase.dart';
import '../../domain/usecases/generate_mnemonic_usecase.dart';
import '../../domain/usecases/generate_private_key_from_mnemonic_usecase.dart';
import '../../domain/usecases/get_account_mnemonic_usecase.dart';
import '../../domain/usecases/get_account_private_key_usecase.dart';
import '../../domain/usecases/get_account_public_key_usecase.dart';
import '../../domain/usecases/get_accounts_from_mnemonic_usecase.dart';
import '../../domain/usecases/get_active_account_usecase.dart';
import '../../domain/usecases/get_aptos_account_usecase.dart';
import '../../domain/usecases/get_mnemonic_usecase.dart';
import '../../domain/usecases/get_private_key_usecase.dart';
import '../../domain/usecases/has_active_account_usecase.dart';
import '../../domain/usecases/import_mnemonic_usecase.dart';
import '../../domain/usecases/import_private_key_usecase.dart';
import '../../domain/usecases/list_aptos_account_usecase.dart';
import '../../domain/usecases/set_active_account_usecase.dart';
import '../../domain/usecases/sign_buffer_usecase.dart';
import '../../domain/usecases/update_account_background_color_usecase.dart';
import '../../domain/usecases/update_account_icon_uri_usecase.dart';
import '../../domain/usecases/update_account_label_usecase.dart';

part 'generated/usecase_provider.g.dart';

@riverpod
IEntropyRepository entropyRepository(Ref ref) {
  final SecureStorageService secureStorage = ref.read(
    secureStorageServiceProvider,
  );
  final Store objectBoxStore = ref.read(objectBoxStoreProvider).requireValue;
  final EntropyDataSource entropyDataSource = EntropyDataSource(
    secureStorage: secureStorage,
  );
  final HDKeyDataSource hdKeyDataSource = HDKeyDataSource(
    box: objectBoxStore.box(),
  );

  return EntropyRepository(
    store: objectBoxStore,
    entropyDataSource: entropyDataSource,
    hdKeyDataSource: hdKeyDataSource,
  );
}

@riverpod
IPrivateJwkRepository privateJwkRepository(Ref ref) {
  final SecureStorageService secureStorage = ref.read(
    secureStorageServiceProvider,
  );
  final Store objectBoxStore = ref.read(objectBoxStoreProvider).requireValue;
  final PrivateJwkDataSource privateJwkDataSource = PrivateJwkDataSource(
    secureStorage: secureStorage,
  );
  final SigningKeyDataSource signingKeyDataSource = SigningKeyDataSource(
    box: objectBoxStore.box(),
  );

  return PrivateJwkRepository(
    store: objectBoxStore,
    signingKeyDataSource: signingKeyDataSource,
    privateJwkDataSource: privateJwkDataSource,
  );
}

@riverpod
IJwkRepository jwkRepository(Ref ref) {
  final SecureStorageService secureStorage = ref.read(
    secureStorageServiceProvider,
  );
  final Store objectBoxStore = ref.read(objectBoxStoreProvider).requireValue;

  final JwkDataSource jwkDataSource = JwkDataSource(box: objectBoxStore.box());
  final HDKeyDataSource hdKeyDataSource = HDKeyDataSource(
    box: objectBoxStore.box(),
  );
  final SigningKeyDataSource signingKeyDataSource = SigningKeyDataSource(
    box: objectBoxStore.box(),
  );
  final Ed25519AuthKeyConfigLocalDataSource ed25519AuthKeyConfigDataSource =
      Ed25519AuthKeyConfigLocalDataSource(box: objectBoxStore.box());
  final EntropyDataSource entropyDataSource = EntropyDataSource(
    secureStorage: secureStorage,
  );
  final PrivateJwkDataSource privateJwkDataSource = PrivateJwkDataSource(
    secureStorage: secureStorage,
  );

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
IAptosAccountRepository aptosAccountRepository(Ref ref) {
  final Store objectBoxStore = ref.read(objectBoxStoreProvider).requireValue;
  final JwkDataSource jwkDataSource = JwkDataSource(box: objectBoxStore.box());
  final Ed25519AuthKeyConfigLocalDataSource ed25519ConfigDataSource =
      Ed25519AuthKeyConfigLocalDataSource(box: objectBoxStore.box());
  final AptosAccountLocalDataSource aptosAccountDataSource =
      AptosAccountLocalDataSource(box: objectBoxStore.box());
  final AccountMetadataLocalDataSource accountMetadataDataSource =
      AccountMetadataLocalDataSource(box: objectBoxStore.box());

  return AptosAccountRepository(
    store: objectBoxStore,
    metadataDataSource: accountMetadataDataSource,
    accountDataSource: aptosAccountDataSource,
    jwkDataSource: jwkDataSource,
    ed25519ConfigDataSource: ed25519ConfigDataSource,
  );
}

@riverpod
IActiveAccountRepository activeAccountRepository(Ref ref) {
  final Store objectBoxStore = ref.read(objectBoxStoreProvider).requireValue;
  final SharedPreferencesService sharedPreferences =
      ref.read(sharedPreferencesServiceProvider).requireValue;

  final ActiveAccountLocalDataSource activeAccountDataSource =
      ActiveAccountLocalDataSource(sharedPreferences: sharedPreferences);
  final AptosAccountLocalDataSource accountDataSource =
      AptosAccountLocalDataSource(box: objectBoxStore.box());
  final AccountMetadataLocalDataSource accountMetadataDataSource =
      AccountMetadataLocalDataSource(box: objectBoxStore.box());

  return ActiveAccountRepository(
    store: objectBoxStore,
    activeAccountDataSource: activeAccountDataSource,
    accountDataSource: accountDataSource,
    accountMetadataDataSource: accountMetadataDataSource,
  );
}

@riverpod
GenerateMnemonicUseCase generateMnemonicUseCase(Ref ref) =>
    GenerateMnemonicUseCase(repository: ref.read(entropyRepositoryProvider));

@riverpod
ImportMnemonicUseCase importMnemonicUseCase(Ref ref) =>
    ImportMnemonicUseCase(repository: ref.read(entropyRepositoryProvider));

@riverpod
GetMnemonicUseCase getMnemonicUseCase(Ref ref) =>
    GetMnemonicUseCase(repository: ref.read(entropyRepositoryProvider));

@riverpod
GetAccountsFromMnemonicUseCase getAccountsFromMnemonicUseCase(Ref ref) =>
    GetAccountsFromMnemonicUseCase(
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
GetPrivateKeyUseCase getPrivateKeyUseCase(Ref ref) =>
    GetPrivateKeyUseCase(repository: ref.read(privateJwkRepositoryProvider));

@riverpod
GeneratePrivateKeyFromMnemonicUseCase generatePrivateKeyFromMnemonicUseCase(
  Ref ref,
) => GeneratePrivateKeyFromMnemonicUseCase(
  entropyRepository: ref.read(entropyRepositoryProvider),
  jwkRepository: ref.read(jwkRepositoryProvider),
);

@riverpod
CreateAptosAccountUseCase createAptosAccountUseCase(Ref ref) =>
    CreateAptosAccountUseCase(
      repository: ref.read(aptosAccountRepositoryProvider),
    );

@riverpod
DeleteAptosAccountUseCase deleteAptosAccountUseCase(Ref ref) =>
    DeleteAptosAccountUseCase(
      repository: ref.read(aptosAccountRepositoryProvider),
    );

@riverpod
GetAptosAccountUseCase getAptosAccountUseCase(Ref ref) =>
    GetAptosAccountUseCase(
      repository: ref.read(aptosAccountRepositoryProvider),
    );

@riverpod
ListAptosAccountsUseCase listAptosAccountsUseCase(Ref ref) =>
    ListAptosAccountsUseCase(
      repository: ref.read(aptosAccountRepositoryProvider),
    );

@riverpod
GetAccountPublicKeyUseCase getAccountPublicKeyUseCase(Ref ref) =>
    GetAccountPublicKeyUseCase(
      accountRepository: ref.read(aptosAccountRepositoryProvider),
      jwkRepository: ref.read(jwkRepositoryProvider),
    );

@riverpod
GetAccountPrivateKeyUseCase getAccountPrivateKeyUseCase(Ref ref) =>
    GetAccountPrivateKeyUseCase(
      accountRepository: ref.read(aptosAccountRepositoryProvider),
      jwkRepository: ref.read(jwkRepositoryProvider),
      entropyRepository: ref.read(entropyRepositoryProvider),
      privateJwkRepository: ref.read(privateJwkRepositoryProvider),
    );

@riverpod
GetAccountMnemonicUseCase getAccountMnemonicUseCase(Ref ref) =>
    GetAccountMnemonicUseCase(
      accountRepository: ref.read(aptosAccountRepositoryProvider),
      jwkRepository: ref.read(jwkRepositoryProvider),
      entropyRepository: ref.read(entropyRepositoryProvider),
    );

@riverpod
CheckMnemonicAvailabilityUseCase checkMnemonicAvailabilityUseCase(Ref ref) =>
    CheckMnemonicAvailabilityUseCase(
      accountRepository: ref.read(aptosAccountRepositoryProvider),
      jwkRepository: ref.read(jwkRepositoryProvider),
    );

@riverpod
SignBufferUseCase signBufferUseCase(Ref ref) => SignBufferUseCase(
  accountRepository: ref.read(aptosAccountRepositoryProvider),
  jwkRepository: ref.read(jwkRepositoryProvider),
  entropyRepository: ref.read(entropyRepositoryProvider),
  privateJwkRepository: ref.read(privateJwkRepositoryProvider),
);

@riverpod
GetActiveAccountUseCase getActiveAccountUseCase(Ref ref) =>
    GetActiveAccountUseCase(
      repository: ref.read(activeAccountRepositoryProvider),
    );

@riverpod
SetActiveAccountUseCase setActiveAccountUseCase(Ref ref) =>
    SetActiveAccountUseCase(
      repository: ref.read(activeAccountRepositoryProvider),
    );

@riverpod
ClearActiveAccountUseCase clearActiveAccountUseCase(Ref ref) =>
    ClearActiveAccountUseCase(
      repository: ref.read(activeAccountRepositoryProvider),
    );

@riverpod
HasActiveAccountUseCase hasActiveAccountUseCase(Ref ref) =>
    HasActiveAccountUseCase(
      repository: ref.read(activeAccountRepositoryProvider),
    );

@riverpod
UpdateAccountBackgroundColorUseCase updateAccountBackgroundColorUseCase(
  Ref ref,
) => UpdateAccountBackgroundColorUseCase(
  repository: ref.read(aptosAccountRepositoryProvider),
);

@riverpod
UpdateAccountIconUriUseCase updateAccountIconUriUseCase(Ref ref) =>
    UpdateAccountIconUriUseCase(
      repository: ref.read(aptosAccountRepositoryProvider),
    );

@riverpod
UpdateAccountLabelUseCase updateAccountLabelUseCase(Ref ref) =>
    UpdateAccountLabelUseCase(
      repository: ref.read(aptosAccountRepositoryProvider),
    );
