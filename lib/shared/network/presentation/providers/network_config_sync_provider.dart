// // in presentation/providers/network_config_sync_provider.dart
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../../domain/entities/network_config.dart';
// import '../../domain/usecases/sync_network_configs_usecase.dart';
// import 'usecase_provider.dart';

// part 'generated/network_config_sync_provider.g.dart';

// @Riverpod(keepAlive: true)
// class NetworkConfigSync extends _$NetworkConfigSync {
//   @override
//   Future<List<NetworkConfig>> build() async {
//     // Initial sync on app start
//     await _syncNetworks();
//     return _getStoredNetworks();
//   }

//   Future<void> _syncNetworks() async {
//     try {
//       await ref.read(syncNetworkConfigsUseCaseProvider)();
//     } catch (e) {
//       print('Network sync failed: $e');
//     }
//   }

//   List<NetworkConfig> _getStoredNetworks() {
//     return ref.read(getAllNetworkConfigsUseCaseProvider)();
//   }

//   Future<void> manualSync() async {
//     state = const AsyncValue.loading();
//     try {
//       await _syncNetworks();
//       state = AsyncValue.data(_getStoredNetworks());
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }
// }
