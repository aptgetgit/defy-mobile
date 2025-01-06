import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/time_provider.g.dart';

@riverpod
Stream<int> userWalletHoldingsFetchtimer(UserWalletHoldingsFetchtimerRef ref,) {
  return Stream.periodic(Duration(seconds: 10), (count) => count);
}

@riverpod
Stream<int> tokenMetadataFetchtimer(TokenMetadataFetchtimerRef ref,) {
  return Stream.periodic(Duration(seconds: 3), (count) => count);
}