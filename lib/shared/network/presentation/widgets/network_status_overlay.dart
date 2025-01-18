import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/logging/app_logger.dart';
import '../../domain/entities/network_status.dart';
import '../providers/network_status_provider.dart';
import 'network_status_banner.dart';

class NetworkStatusOverlay extends ConsumerStatefulWidget {
  const NetworkStatusOverlay({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  ConsumerState<NetworkStatusOverlay> createState() =>
      _NetworkStatusOverlayState();
}

class _NetworkStatusOverlayState extends ConsumerState<NetworkStatusOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final Animation<Offset> _slideAnimation;
  final OverlayPortalController _portalController = OverlayPortalController();
  StreamSubscription<NetworkStatus>? _subscription;
  NetworkStatus? _currentStatus;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(_animation);

    // Listen to animation status to handle completion
    _controller.addStatusListener(_handleAnimationStatus);
  }

  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      _portalController.hide();
    }
  }

  void _updateNetworkStatus(NetworkStatus status) {
    if (_isDisposed) {
      return;
    }

    setState(() => _currentStatus = status);
    _updateOverlayVisibility(status);
  }

  void _updateOverlayVisibility(NetworkStatus status) {
    final bool shouldShow = status is Offline || status is Limited;

    if (shouldShow && !_portalController.isShowing) {
      _portalController.show();
      _controller.forward();
    } else if (!shouldShow && _portalController.isShowing) {
      _controller.reverse();
    }
  }

  void _setupStreamSubscription(Stream<NetworkStatus> stream) {
    _subscription?.cancel();
    _subscription = stream.distinct().listen(
      _updateNetworkStatus,
      onError: (Object error) {
        AppLogger.debug('Error in network status stream', error: error);
        if (_isDisposed) {
          return;
        }

        setState(() => _currentStatus = const NetworkStatus.offline());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Listen for network status changes
    ref.listen<AsyncValue<Stream<NetworkStatus>>>(
      networkStatusProvider,
      (_, AsyncValue<Stream<NetworkStatus>> next) {
        next.whenData(_setupStreamSubscription);
      },
    );

    return Material(
      child: Navigator(
        onGenerateRoute: (RouteSettings settings) => MaterialPageRoute<void>(
          builder: (BuildContext context) => OverlayPortal(
            controller: _portalController,
            overlayChildBuilder: (BuildContext context) => _buildOverlay(),
            child: widget.child,
          ),
        ),
      ),
    );
  }

  Widget _buildOverlay() => Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Material(
          elevation: 4,
          child: SafeArea(
            child: FadeTransition(
              opacity: _animation,
              child: SlideTransition(
                position: _slideAnimation,
                child: _currentStatus != null
                    ? NetworkStatusBanner(status: _currentStatus!)
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _isDisposed = true;
    _controller.removeStatusListener(_handleAnimationStatus);
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<NetworkStatus?>('currentStatus', _currentStatus),
      )
      ..add(
        DiagnosticsProperty<bool>(
          'isShowingOverlay',
          _portalController.isShowing,
        ),
      );
  }
}
