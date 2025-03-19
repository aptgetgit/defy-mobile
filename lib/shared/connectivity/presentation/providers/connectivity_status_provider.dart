import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/entities/connectivity_config.dart';
import '../states/connectivity_state.dart';

part 'generated/connectivity_status_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Stream<ConnectivityState>> connectivityStatus(Ref ref) async {
  const ConnectivityConfig config = ConnectivityConfig(
    checkUrls: <String>['https://1.1.1.1'],
    timeout: Duration(seconds: 3),
  );
  final Connectivity connectivity = Connectivity();

  Future<bool> checkInternetAccess() async {
    int failedAttempts = 0;
    const int maxFailedAttempts = 3;

    try {
      final List<InternetAddress> results = await InternetAddress.lookup(
        config.lookupAddress,
      ).timeout(const Duration(seconds: 5));
      return results.isNotEmpty && results[0].rawAddress.isNotEmpty;
    } on Exception catch (_) {
      failedAttempts++;
    }

    for (final String url in config.checkUrls) {
      try {
        if (failedAttempts >= maxFailedAttempts) {
          return false;
        }
        final http.Response response = await http
            .get(Uri.parse(url))
            .timeout(config.timeout);
        if (response.statusCode == 200) {
          return true;
        }
        failedAttempts++;
      } on Exception catch (_) {
        failedAttempts++;
        continue;
      }
    }

    return false;
  }

  final Stream<List<ConnectivityResult>> initialCheck =
      Stream<List<ConnectivityResult>>.fromFuture(
        connectivity.checkConnectivity().timeout(
          const Duration(seconds: 5),
          onTimeout: () => <ConnectivityResult>[ConnectivityResult.none],
        ),
      );

  final Stream<List<ConnectivityResult>> changes =
      connectivity.onConnectivityChanged;

  return Rx.merge<List<ConnectivityResult>>(<Stream<List<ConnectivityResult>>>[
    initialCheck,
    changes,
  ]).debounceTime(const Duration(milliseconds: 500)).asyncMap((
    List<ConnectivityResult> results,
  ) async {
    try {
      // Handle empty or invalid results
      if (results.isEmpty ||
          results.contains(ConnectivityResult.none) ||
          (results.contains(ConnectivityResult.bluetooth) &&
              results.length == 1)) {
        return ConnectivityState.offline;
      }

      final bool hasInternet = await checkInternetAccess();

      // Find the highest priority connection type
      // Priority: VPN > Ethernet > WiFi > Mobile > Others
      ConnectivityResult? primaryConnection;
      for (final ConnectivityResult type in <ConnectivityResult>[
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
        ConnectivityResult.mobile =>
          hasInternet ? ConnectivityState.online : ConnectivityState.offline,
        ConnectivityResult.wifi ||
        ConnectivityResult.ethernet ||
        ConnectivityResult.vpn =>
          hasInternet ? ConnectivityState.online : ConnectivityState.limited,
        _ => ConnectivityState.offline,
      };
    } on Exception catch (_) {
      return ConnectivityState.offline;
    }
  }).distinct();
}

@riverpod
Stream<bool> isOnline(Ref ref) {
  final Stream<ConnectivityState> stream =
      ref.watch(connectivityStatusProvider).requireValue;

  return stream.map((ConnectivityState status) => status.isOnline);
}
