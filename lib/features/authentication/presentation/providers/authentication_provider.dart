import 'package:defy/core/providers/ory_kratos_provider.dart';
import 'package:defy/core/providers/secure_storage_provider.dart';
import 'package:defy/core/providers/shared_preferences_provider.dart';
import 'package:defy/features/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:defy/features/authentication/data/sources/remote/kratos_data_source.dart';
import 'package:defy/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:defy/features/authentication/domain/usecases/use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/authentication_provider.g.dart';

@riverpod
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  final oryKratosFrontendApi =
      ref.read(oryKratosClientServiceProvider).frontendApi;
  final oryKratosDataSource = KratosDataSourceImpl(oryKratosFrontendApi);
  final secureStorageService = ref.read(secureStorageServiceProvider);
  final sharedPreferencesService = ref.read(sharedPreferencesServiceProvider);
  return AuthenticationRepositoryImpl(
    oryKratosDataSource,
    secureStorageService,
    sharedPreferencesService,
  );
}

@riverpod
GetCurrentSessionUseCase getCurrentSessionUseCase(
    GetCurrentSessionUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return GetCurrentSessionUseCase(repository);
}

@riverpod
InitiateRegistrationUseCase initiateRegistrationUseCase(InitiateRegistrationUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return InitiateRegistrationUseCase(repository);
}

@riverpod
CompleteRegistrationUseCase completeRegistrationUseCase(CompleteRegistrationUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return CompleteRegistrationUseCase(repository);
}

@riverpod
InitiateLoginUseCase initiateLoginUseCase(InitiateLoginUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return InitiateLoginUseCase(repository);
}

@riverpod
CompleteLoginUseCase completeLoginUseCase(CompleteLoginUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return CompleteLoginUseCase(repository);
}

@riverpod
LogoutUseCase logoutUseCase(LogoutUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return LogoutUseCase(repository);
}

@riverpod
GetLoggedInIdentitiesUseCase getLoggedInIdentitiesUseCase(
    GetLoggedInIdentitiesUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return GetLoggedInIdentitiesUseCase(repository);
}

@riverpod
GetSessionTokenUseCase getSessionTokenUseCase(GetSessionTokenUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return GetSessionTokenUseCase(repository);
}

@riverpod
SaveSessionTokenUseCase saveSessionTokenUseCase(
    SaveSessionTokenUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return SaveSessionTokenUseCase(repository);
}

@riverpod
DeleteSessionTokenUseCase deleteSessionTokenUseCase(
    DeleteSessionTokenUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return DeleteSessionTokenUseCase(repository);
}

@riverpod
SetActiveIdentityUseCase setActiveIdentityUseCase(
    SetActiveIdentityUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return SetActiveIdentityUseCase(repository);
}

@riverpod
GetActiveIdentityUseCase getActiveIdentityUseCase(
    GetActiveIdentityUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return GetActiveIdentityUseCase(repository);
}

@riverpod
GetSessionDetailsUseCase getSessionDetailsUseCase(
    GetSessionDetailsUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return GetSessionDetailsUseCase(repository);
}

@riverpod
SaveSessionDetailsUseCase saveSessionDetailsUseCase(
    SaveSessionDetailsUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return SaveSessionDetailsUseCase(repository);
}

@riverpod
DeleteSessionDetailsUseCase deleteSessionDetailsUseCase(
    DeleteSessionDetailsUseCaseRef ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return DeleteSessionDetailsUseCase(repository);
}
