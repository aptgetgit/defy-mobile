import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../states/connectivity_state.dart';

class ConnectivityBanner extends StatelessWidget {
  const ConnectivityBanner({
    required this.status,
    super.key,
  });

  final ConnectivityState status;

  @override
  Widget build(BuildContext context) {
    final bool isOffline = status == ConnectivityState.offline;
    final bool isLimited = status == ConnectivityState.limited;

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
    properties.add(DiagnosticsProperty<ConnectivityState>('status', status));
  }
}
