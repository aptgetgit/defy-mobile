import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/aptos_network.dart';
import 'usecase_provider.dart';

part 'generated/active_network_provider.g.dart';

@riverpod
class ActiveNetwork extends _$ActiveNetwork {
  @override
  Future<AptosNetwork> build() =>
      ref.watch(getActiveNetworkUseCaseProvider).call();

  Future<void> setNetwork(AptosNetwork network) async {
    await ref.read(setActiveNetworkUseCaseProvider).call(network);
    ref.invalidateSelf();
  }
}

@riverpod
AptosNetwork? currentNetwork(Ref ref) =>
    ref.watch(activeNetworkProvider).valueOrNull;
