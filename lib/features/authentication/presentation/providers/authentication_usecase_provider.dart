import 'package:defy/core/di/providers/services/ory_kratos_service_provider.dart';
import 'package:defy/core/di/providers/services/secure_storage_service_provider.dart';
import 'package:defy/core/di/providers/services/shared_preference_service_provider.dart';
import 'package:defy/features/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:defy/features/authentication/data/sources/remote/kratos_data_source.dart';
import 'package:defy/features/authentication/domain/usecases/usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/authentication_usecase_provider.g.dart';

@riverpod
AuthenticationRepository authenticationRepository(Ref ref) {
  final oryKratosFrontendApi =
      ref.read(oryKratosClientServiceProvider).frontendApi;
  final oryKratosDataSource = KratosDataSourceImpl(oryKratosFrontendApi);
  final secureStorageService = ref.read(secureStorageServiceProvider);
  final sharedPreferencesService = ref.read(sharedPreferencesServiceProvider);
  return AuthenticationRepository(
    oryKratosDataSource,
    secureStorageService,
    sharedPreferencesService,
  );
}

@riverpod
GetCurrentSessionUseCase getCurrentSessionUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return GetCurrentSessionUseCase(repository);
}

@riverpod
InitiateRegistrationUseCase initiateRegistrationUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return InitiateRegistrationUseCase(repository);
}

@riverpod
CompleteRegistrationUseCase completeRegistrationUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return CompleteRegistrationUseCase(repository);
}

@riverpod
InitiateLoginUseCase initiateLoginUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return InitiateLoginUseCase(repository);
}

@riverpod
CompleteLoginUseCase completeLoginUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return CompleteLoginUseCase(repository);
}

@riverpod
LogoutUseCase logoutUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return LogoutUseCase(repository);
}

@riverpod
GetLoggedInIdentitiesUseCase getLoggedInIdentitiesUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return GetLoggedInIdentitiesUseCase(repository);
}

@riverpod
GetSessionTokenUseCase getSessionTokenUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return GetSessionTokenUseCase(repository);
}

@riverpod
SaveSessionTokenUseCase saveSessionTokenUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return SaveSessionTokenUseCase(repository);
}

@riverpod
DeleteSessionTokenUseCase deleteSessionTokenUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return DeleteSessionTokenUseCase(repository);
}

@riverpod
SetActiveIdentityUseCase setActiveIdentityUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return SetActiveIdentityUseCase(repository);
}

@riverpod
GetActiveIdentityUseCase getActiveIdentityUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return GetActiveIdentityUseCase(repository);
}

@riverpod
GetSessionDetailsUseCase getSessionDetailsUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return GetSessionDetailsUseCase(repository);
}

@riverpod
SaveSessionDetailsUseCase saveSessionDetailsUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return SaveSessionDetailsUseCase(repository);
}

@riverpod
DeleteSessionDetailsUseCase deleteSessionDetailsUseCase(Ref ref) {
  final repository = ref.read(authenticationRepositoryProvider);
  return DeleteSessionDetailsUseCase(repository);
}
