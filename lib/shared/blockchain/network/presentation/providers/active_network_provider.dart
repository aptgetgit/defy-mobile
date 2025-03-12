// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../../domain/entities/aptos_network.dart';
// import '../../domain/usecases/clear_active_network_usecase.dart';
// import '../../domain/usecases/get_active_network_usecase.dart';
// import '../../domain/usecases/set_active_network_usecase.dart';
// import 'usecase_provider.dart';

// part 'generated/active_network_provider.g.dart';

// @riverpod
// class ActiveNetwork extends _$ActiveNetwork {
//   @override
//   Future<AptosNetwork> build() async {
//     final GetActiveNetworkUseCase getActiveNetwork = ref.read(getActiveNetworkUseCaseProvider);
//     final SetActiveNetworkUseCase setActiveNetwork = ref.read(setActiveNetworkUseCaseProvider);

//     final AptosNetwork? activeNetwork = getActiveNetwork.call();
//     if (activeNetwork != null) {
//       return activeNetwork;
//     }

//     const AptosNetwork defaultNetwork = AptosNetwork.mainnet();
//     await setActiveNetwork.call(defaultNetwork);
//     return defaultNetwork;
//   }

//   Future<void> setActiveNetwork(AptosNetwork network) async {
//     final SetActiveNetworkUseCase setActiveNetwork = ref.read(setActiveNetworkUseCaseProvider);
//     await setActiveNetwork.call(network);
//     ref.invalidateSelf();
//   }

//   Future<void> clearActiveNetwork() async {
//     final ClearActiveNetworkUseCase clearActiveNetwork = ref.read(clearActiveNetworkUseCaseProvider);
//     await clearActiveNetwork.call();
//     ref.invalidateSelf();
//   }
// }

// @riverpod
// AptosNetwork? currentNetwork(Ref ref) =>
//     ref.watch(activeNetworkProvider).valueOrNull;
