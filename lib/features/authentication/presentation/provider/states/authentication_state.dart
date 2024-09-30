import 'package:defy/features/authentication/domain/entities/session_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
const factory AuthenticationState.unauthenticated() = _Unauthenticated;
  const factory AuthenticationState.authenticating() = _Authenticating;
  const factory AuthenticationState.authenticated(SessionEntity session) = _Authenticated;
}

