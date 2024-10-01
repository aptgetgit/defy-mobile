import 'package:defy/features/authentication/domain/entities/session_entity.dart';
import 'package:defy/features/authentication/domain/repositories/authentication_repository.dart';

class GetCurrentSessionUseCase {
  final AuthenticationRepository _repository;

  GetCurrentSessionUseCase(this._repository);

  Future<SessionEntity> call(String sessionToken) {
    return _repository.getCurrentSession(sessionToken);
  }
}

class InitiateRegistrationUseCase {
  final AuthenticationRepository _repository;

  InitiateRegistrationUseCase(this._repository);

  Future<String> call(InitiateRegistrationOptions options) {
    return _repository.initiateRegistration(options);
  }
}

class CompleteRegistrationUseCase {
  final AuthenticationRepository _repository;

  CompleteRegistrationUseCase(this._repository);

  Future<SessionEntity> call(CompleteRegistrationOptions options) {
    return _repository.completeRegistration(options);
  }
}

class InitiateLoginUseCase {
  final AuthenticationRepository _repository;

  InitiateLoginUseCase(this._repository);

  Future<String> call(InitiateLoginOptions options) {
    return _repository.initiateLogin(options);
  }
}

class CompleteLoginUseCase {
  final AuthenticationRepository _repository;

  CompleteLoginUseCase(this._repository);

  Future<SessionEntity> call(CompleteLoginOptions options) {
    return _repository.completeLogin(options);
  }
}

class LogoutUseCase {
  final AuthenticationRepository _repository;

  LogoutUseCase(this._repository);

  Future<void> call(String identityId) {
    return _repository.logout(identityId);
  }
}

class GetLoggedInIdentitiesUseCase {
  final AuthenticationRepository _repository;

  GetLoggedInIdentitiesUseCase(this._repository);

  Future<List<IdentityEntity>> call() {
    return _repository.getLoggedInIdentities();
  }
}

class GetSessionTokenUseCase {
  final AuthenticationRepository _repository;

  GetSessionTokenUseCase(this._repository);

  Future<String> call(String identityId) {
    return _repository.getSessionToken(identityId);
  }
}

class SaveSessionTokenUseCase {
  final AuthenticationRepository _repository;

  SaveSessionTokenUseCase(this._repository);

  Future<void> call(String identityId, String token) {
    return _repository.saveSessionToken(identityId, token);
  }
}

class DeleteSessionTokenUseCase {
  final AuthenticationRepository _repository;

  DeleteSessionTokenUseCase(this._repository);

  Future<void> call(String identityId) {
    return _repository.deleteSessionToken(identityId);
  }
}

class GetSessionDetailsUseCase {
  final AuthenticationRepository _repository;

  GetSessionDetailsUseCase(this._repository);

  Future<SessionEntity> call(String identityId) {
    return _repository.getSessionDetails(identityId);
  }
}

class SaveSessionDetailsUseCase {
  final AuthenticationRepository _repository;

  SaveSessionDetailsUseCase(this._repository);

  Future<void> call(SessionEntity session) {
    return _repository.saveSessionDetails(session);
  }
}

class DeleteSessionDetailsUseCase {
  final AuthenticationRepository _repository;

  DeleteSessionDetailsUseCase(this._repository);

  Future<void> call(String identityId) {
    return _repository.deleteSessionDetails(identityId);
  }
}

class SetActiveIdentityUseCase {
  final AuthenticationRepository _repository;

  SetActiveIdentityUseCase(this._repository);

  Future<void> call(String identityId) {
    return _repository.setActiveIdentity(identityId);
  }
}

class DeleteActiveIdentityUseCase {
  final AuthenticationRepository _repository;

  DeleteActiveIdentityUseCase(this._repository);

  Future<void> call() {
    return _repository.deleteActiveIdentity();
  }
}

class GetActiveIdentityUseCase {
  final AuthenticationRepository _repository;

  GetActiveIdentityUseCase(this._repository);

  String? call() {
    return _repository.getActiveIdentity();
  }
}