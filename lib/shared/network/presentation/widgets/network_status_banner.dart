import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/network_status.dart';

class NetworkStatusBanner extends StatelessWidget {
  const NetworkStatusBanner({
    required this.status,
    super.key,
  });

  final NetworkStatus status;

  @override
  Widget build(BuildContext context) {
    final bool isOffline = status is Offline;
    final bool isLimited = status is Limited;

    return Container(
      width: double.infinity,
      color: isOffline
          ? Colors.red.shade100
          : isLimited
              ? Colors.orange.shade100
              : Colors.green.shade100,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        isOffline
            ? 'You are offline'
            : isLimited
                ? 'Limited connectivity'
                : 'Connected',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isOffline
              ? Colors.red.shade900
              : isLimited
                  ? Colors.orange.shade900
                  : Colors.green.shade900,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<NetworkStatus>('status', status));
  }
}
