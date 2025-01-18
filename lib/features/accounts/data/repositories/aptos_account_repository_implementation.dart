import 'dart:typed_data';
import '../../domain/repositories/aptos_account_repository.dart';
import '../models/local/aptos_account_local_model.dart';
import '../models/local/auth_scheme_config_local_model.dart';
import '../models/local/public_key_local_model.dart';
import '../sources/local/aptos_account_local_data_source.dart';
import '../sources/local/public_key_local_data_source.dart';

class AptosAccountRepository implements IAptosAccountRepository {
  AptosAccountRepository(this._localDataSource, this._publicKeyDataSource);
  final AptosAccountLocalDataSource _localDataSource;
  final PublicKeyLocalDataSource _publicKeyDataSource;

//  // Helper methods
//  Uint8List _addressToBytes(String address) = HexString(address).toUint8Array();
//  String _bytesToAddress(Uint8List bytes) = HexString.fromUint8Array(bytes).toString();

  @override
  int storeAccountWithAuthConfig({
    required Uint8List accountAddress,
    required Uint8List authenticationKey,
    required Uint8List kId,
  }) {
    final PublicKeyLocalModel? publicKey =
        _publicKeyDataSource.findPublicKeyByKId(kId);
    if (publicKey == null) {
      throw StateError('Public key not found for kId');
    }

    return _localDataSource.storeAccountWithAuthSchemeConfig(
      StoreAptosAccountParams.withEd25519Config(
        accountAddress: accountAddress,
        authenticationKey: authenticationKey,
        publicKeyId: publicKey.localId,
      ),
    );
  }

  @override
  AptosAccountLocalModel? findAccountByAddress(Uint8List address) {
    try {
      return _localDataSource.findAccountByAddress(address);
    } catch (e) {
      throw StateError('Failed to find account: $e');
    }
  }

  @override
  Ed25519AuthSchemeConfigLocalModel? findAuthConfigByAccountId(
    int accountId,
  ) {
    try {
      return _localDataSource.findAuthConfigByAccountId(accountId);
    } catch (e) {
      throw StateError('Failed to find auth config: $e');
    }
  }

  @override
  List<Ed25519AuthSchemeConfigLocalModel> findAuthConfigsByPublicKeyId(
    int publicKeyId,
  ) {
    try {
      return _localDataSource.findAuthConfigsByPublicKeyId(publicKeyId);
    } catch (e) {
      throw StateError('Failed to find auth configs: $e');
    }
  }

  @override
  List<AptosAccountLocalModel> findAccountsByKId(Uint8List kId) {
    try {
      final PublicKeyLocalModel? publicKey =
          _publicKeyDataSource.findPublicKeyByKId(kId);
      if (publicKey == null) {
        return <AptosAccountLocalModel>[];
      }
      return _localDataSource.findAccountsByPublicKeyId(publicKey.localId);
    } catch (e) {
      throw StateError('Failed to find accounts by kId: $e');
    }
  }

  @override
  List<AptosAccountLocalModel> findAccountsByAuthKey(
    Uint8List authenticationKey,
  ) {
    try {
      return _localDataSource.findAccountsByAuthKey(authenticationKey);
    } catch (e) {
      throw StateError('Failed to find accounts by auth key: $e');
    }
  }

  @override
  bool hasAccountWithAddress(Uint8List address) {
    try {
      return _localDataSource.hasAccountWithAddress(address);
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  List<AptosAccountLocalModel> getAllAccounts() {
    try {
      return _localDataSource.getAllAccounts();
    } catch (e) {
      throw StateError('Failed to get all accounts: $e');
    }
  }

  @override
  int getAccountCount() {
    try {
      return _localDataSource.getAccountCount();
    } catch (e) {
      throw StateError('Failed to get account count: $e');
    }
  }

  // @override
  // void updateAuthenticationKey({
  //   required Uint8List address,
  //   required Uint8List newAuthKey,
  // }) {
  //   try {
  //     _localDataSource.updateAuthenticationKey(address, newAuthKey);
  //   } catch (e) {
  //     throw StateError('Failed to update authentication key: $e');
  //   }
  // }

  @override
  void deleteAccountByAddress(Uint8List address) {
    try {
      _localDataSource.deleteAccountByAddress(address);
    } catch (e) {
      throw StateError('Failed to delete account: $e');
    }
  }
}
