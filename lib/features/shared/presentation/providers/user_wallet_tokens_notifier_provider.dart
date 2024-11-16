import 'package:defy/features/shared/domain/entities/user_wallet_token.dart';
import 'package:defy/features/shared/presentation/providers/graphql_provider.dart';
import 'package:defy/features/shared/presentation/providers/time_provider.dart';
import 'package:defy/features/shared/presentation/providers/user_wallet_tokens_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/user_wallet_tokens_notifier_provider.g.dart';

@riverpod
class UserWalletTokens extends _$UserWalletTokens {
  @override
  FutureOr<List<UserWalletToken>?> build() async {
    _periodicFetch();
    //use data from local storage first to show the tokens - not implemented 
    return _fetchData();
  }

  Future<List<UserWalletToken>?> _fetchData() async {
    final aptosClient = ref.read(aptosGraphQlClientProvider);
    const ownerAddress =
        "0xc9c0328adabaa3d546bfb321d30ee5c827e7f175e9f122d4530fb218c67aee70";
    final usecase = ref.read(userWalletTokensUsecaseProvider);
    return await usecase.call(ownerAddress, aptosClient);
  }

  Future<void> _periodicFetch() async {
    ref.listen(userWalletHoldingsFetchtimerProvider, (_, __) {
      _backgroundFetch();
    });
  }

  Future<void> _backgroundFetch() async {
    print("-----------background call------------");
    try {
      final newData = await _fetchData();
      if (!_areListsEqual(newData, state.value)) {
    print("-------------------------------NEW DATA-----------------------------");
        state = AsyncValue.data(newData);
      }
    } catch (e) {}
  }

  bool _areListsEqual(
      List<UserWalletToken>? list1, List<UserWalletToken>? list2) {
    if (list1 == null || list2 == null) return list1 == list2;
    if (list1.length != list2.length) return false;

    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }

    return true;
  }
}
