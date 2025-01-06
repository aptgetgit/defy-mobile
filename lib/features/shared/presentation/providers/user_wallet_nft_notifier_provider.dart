import 'package:defy/features/shared/domain/entities/user_wallet_nft.dart';
import 'package:defy/features/shared/presentation/providers/time_provider.dart';
import 'package:defy/features/shared/presentation/providers/user_wallet_nft_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/user_wallet_nft_notifier_provider.g.dart';

@riverpod
class UserWalletNFTList extends _$UserWalletNFTList {
  @override
  FutureOr<List<List<UserWalletNFT>?>?> build() {
    _periodicFetch();
    //use data from local storage first to show the tokens - not implemented 
    return _fetchData();
  }

  FutureOr<List<List<UserWalletNFT>?>?> _fetchData() async {
    final ownerAddress = "0xc1f94e94c98487b940c4ca9090d9bdd1e71e380a99d792f13c994387c41101e4";
    final usecase = ref.read(userWalletNftUsecaseProvider);
    return await usecase.call(ownerAddress);
  }

  Future<void> _periodicFetch() async {
    ref.listen(userWalletHoldingsFetchtimerProvider, (_, __) {
      _backgroundFetch();
    });
  }

  Future<void> _backgroundFetch() async {
    try {
      final newData = await _fetchData();
      if (!_areListsEqual(newData, state.value)) {
        state = AsyncValue.data(newData);
      }
    } catch (e) {}
  }

  bool _areListsEqual(
      List<List<UserWalletNFT>?>? list1, List<List<UserWalletNFT>?>? list2) {
    if (list1 == null || list2 == null) return list1 == list2;
    if (list1.length != list2.length) return false;

    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }

    return true;
  }
}