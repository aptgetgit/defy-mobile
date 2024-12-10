// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "../account_data_state_provider.dart";

class AccountData {
  final String firstName;
  final String username;
  final String provider;
  AccountData({
    required this.firstName,
    required this.username,
    required this.provider,
  });

  AccountData copyWith({
    String? firstName,
    String? username,
    String? provider,
  }) {
    return AccountData(
      firstName: firstName ?? this.firstName,
      username: username ?? this.username,
      provider: provider ?? this.provider,
    );
  }
}
