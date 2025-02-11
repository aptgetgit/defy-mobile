import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/models/local/connectivity_config.dart';
import '../../domain/entities/connectivity_status.dart';

part 'generated/connectivity_provider.g.dart';

@Riverpod(keepAlive: true)
ConnectivityConfig connectivityInitializer(Ref ref) {
  throw UnimplementedError('Connectivity config must be initialized');
}

@Riverpod(keepAlive: true)
Future<Stream<ConnectivityStatus>> connectivityStatus(Ref ref) async {
  final ConnectivityConfig config = ref.watch(connectivityInitializerProvider);
  final Connectivity connectivity = Connectivity();

  Future<bool> checkInternetAccess() async {
    int failedAttempts = 0;
    const int maxFailedAttempts = 3;

    try {
      final List<InternetAddress> results =
          await InternetAddress.lookup(config.lookupAddress)
              .timeout(const Duration(seconds: 5));
      return results.isNotEmpty && results[0].rawAddress.isNotEmpty;
    } on Exception catch (_) {
      failedAttempts++;
    }

    for (final String url in config.checkUrls) {
      try {
        if (failedAttempts >= maxFailedAttempts) {
          return false;
        }
        final http.Response response =
            await http.get(Uri.parse(url)).timeout(config.timeout);
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

  // Create a stream that combines initial check and subsequent changes
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
  ])
      .debounceTime(const Duration(milliseconds: 500))
      .asyncMap((List<ConnectivityResult> results) async {
    try {
      // Handle empty or invalid results
      if (results.isEmpty ||
          results.contains(ConnectivityResult.none) ||
          (results.contains(ConnectivityResult.bluetooth) &&
              results.length == 1)) {
        return const ConnectivityStatus.offline();
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
        ConnectivityResult.mobile => hasInternet
            ? const ConnectivityStatus.online()
            : const ConnectivityStatus.offline(),
        ConnectivityResult.wifi ||
        ConnectivityResult.ethernet ||
        ConnectivityResult.vpn =>
          hasInternet
              ? const ConnectivityStatus.online()
              : const ConnectivityStatus.limited(),
        _ => const ConnectivityStatus.offline(),
      };
    } on Exception catch (_) {
      return const ConnectivityStatus.offline();
    }
  }).distinct();
}

@riverpod
Stream<bool> isOnline(Ref ref) => ref.watch(connectivityStatusProvider).when(
      data: (Stream<ConnectivityStatus> stream) =>
          stream.map((ConnectivityStatus status) => status.isOnline),
      error: Stream.error,
      loading: Stream.empty,
    );
