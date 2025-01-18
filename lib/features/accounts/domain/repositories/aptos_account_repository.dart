import 'dart:typed_data';

import '../../data/models/local/aptos_account_local_model.dart';
import '../../data/models/local/auth_scheme_config_local_model.dart';

abstract class IAptosAccountRepository {
  int storeAccountWithAuthConfig({
    required Uint8List accountAddress,
    required Uint8List authenticationKey,
    required Uint8List kId,
  });

  void deleteAccountByAddress(Uint8List address);

  // void updateAuthenticationKey({
  //   required Uint8List address,
  //   required Uint8List newAuthKey,
  // });

  bool hasAccountWithAddress(Uint8List address);
  AptosAccountLocalModel? findAccountByAddress(Uint8List address);

  Ed25519AuthSchemeConfigLocalModel? findAuthConfigByAccountId(int accountId);
  List<Ed25519AuthSchemeConfigLocalModel> findAuthConfigsByPublicKeyId(
    int publicKeyId,
  );

  List<AptosAccountLocalModel> findAccountsByKId(Uint8List kId);
  List<AptosAccountLocalModel> findAccountsByAuthKey(
    Uint8List authenticationKey,
  );

  List<AptosAccountLocalModel> getAllAccounts();
  int getAccountCount();
}
