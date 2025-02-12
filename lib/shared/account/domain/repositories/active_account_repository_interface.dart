import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';

abstract class IActiveAccountRepository {
  AptosAccountWithMetadata? getActiveAccount();
  
  Future<void> setActiveAccount({required AccountAddress accountAddress});
  
  Future<void> clearActiveAccount();
  
  Future<bool> hasActiveAccount();
}
