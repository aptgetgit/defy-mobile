import 'dart:async';
import 'dart:io';
import 'package:defy/core/models/network_connectivity_config.dart';
import 'package:defy/core/models/network_status.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';

part 'generated/network_connectivity_provider.g.dart';

@Riverpod(keepAlive: true)
NetworkConnectivityConfig networkInitializer(Ref ref) {
  throw UnimplementedError('Network config must be initialized');
}

@Riverpod(keepAlive: true)
Stream<NetworkStatus> networkStatus(Ref ref) {
  final config = ref.watch(networkInitializerProvider);
  final connectivity = Connectivity();

  Future<bool> checkInternetAccess() async {
    try {
      final results = await InternetAddress.lookup(config.lookupAddress);
      return results.isNotEmpty && results[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      // If DNS lookup fails, try HTTP requests
      for (final url in config.checkUrls) {
        try {
          final response =
              await http.get(Uri.parse(url)).timeout(config.timeout);
          if (response.statusCode == 200) {
            return true;
          }
        } catch (_) {
          continue;
        }
      }
      return false;
    }
  }

  // Create a stream that combines initial check and subsequent changes
  final initialCheck = Stream.fromFuture(connectivity.checkConnectivity());
  final changes = connectivity.onConnectivityChanged;

  return Rx.merge<List<ConnectivityResult>>([initialCheck, changes])
      .asyncMap((results) async {
    // Handle empty results
    if (results.isEmpty ||
        results.contains(ConnectivityResult.none) ||
        (results.contains(ConnectivityResult.bluetooth) &&
            results.length == 1)) {
      return const NetworkStatus.offline();
    }

    final hasInternet = await checkInternetAccess();

    // Find the highest priority connection type
    // Priority: VPN > Ethernet > WiFi > Mobile > Others
    ConnectivityResult? primaryConnection;
    for (final type in [
      ConnectivityResult.vpn,
      ConnectivityResult.ethernet,
      ConnectivityResult.wifi,
      ConnectivityResult.mobile,
    ]) {
      if (results.contains(type)) {
        primaryConnection = type;
        break;
      }
    }

    // Determine network status based on primary connection
    return switch (primaryConnection) {
      ConnectivityResult.mobile => hasInternet
          ? const NetworkStatus.online()
          : const NetworkStatus.offline(),
      ConnectivityResult.wifi ||
      ConnectivityResult.ethernet ||
      ConnectivityResult.vpn =>
        hasInternet
            ? const NetworkStatus.online()
            : const NetworkStatus.limited(),
      _ => const NetworkStatus.offline(),
    };
  }).distinct();
}

@riverpod
Stream<bool> isOnline(Ref ref) {
  return ref.watch(networkStatusProvider).when(
        data: (status) => Stream.value(status.isOnline),
        error: (error, stack) => Stream.error(error, stack),
        loading: () => Stream.empty(),
      );
}
