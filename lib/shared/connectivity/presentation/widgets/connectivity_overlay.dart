import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/logging/app_logger.dart';
import '../providers/connectivity_status_provider.dart';
import '../states/connectivity_state.dart';
import 'connectivity_banner.dart';

class ConnectivityOverlay extends ConsumerStatefulWidget {
  const ConnectivityOverlay({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<ConnectivityOverlay> createState() => _ConnectivityOverlayState();
}

class _ConnectivityOverlayState extends ConsumerState<ConnectivityOverlay>
    with SingleTickerProviderStateMixin {
  /// Animation controller for the overlay entrance/exit
  late final AnimationController _controller;
  
  /// Opacity animation for the overlay
  late final Animation<double> _animation;
  
  /// Slide animation for the overlay
  late final Animation<Offset> _slideAnimation;
  
  /// Controller for the overlay portal
  final OverlayPortalController _portalController = OverlayPortalController();
  
  /// Subscription to connectivity status changes
  StreamSubscription<ConnectivityState>? _subscription;
  
  /// Current connectivity status (null before first update)
  ConnectivityState _currentStatus = ConnectivityState.online;
  
  /// Flag to prevent operations after dispose
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    
    // Wait for widget to be fully mounted before initializing stream
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!_isDisposed) {
        await _initializeConnectivityListener();
      }
    });
  }

  /// Initializes the connectivity status listener
  Future<void> _initializeConnectivityListener() async {
    try {
      final Stream<ConnectivityState> stream = 
          ref.read(connectivityStatusProvider).requireValue;
      await _setupStreamSubscription(stream);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to initialize connectivity listener',
        error: e,
        stackTrace: stackTrace,
      );
      
      // Fallback: set status to online to avoid showing error state
      _updateConnectivityStatus(ConnectivityState.online);
    }
  }

  /// Sets up the animations for the overlay
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

    _controller.addStatusListener(_handleAnimationStatus);
  }

  /// Handles animation status changes
  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.dismissed && !_isDisposed) {
      _portalController.hide();
    }
  }

  /// Updates the current connectivity status and manages overlay visibility
  void _updateConnectivityStatus(ConnectivityState status) {
    if (_isDisposed) {
      return;
    }

    AppLogger.debug('Connectivity status updated: $status');
    
    setState(() => _currentStatus = status);
    _updateOverlayVisibility(status);
  }

  /// Updates the overlay visibility based on connectivity status
  void _updateOverlayVisibility(ConnectivityState status) {
    final bool shouldShow = status.isOffline || status.isLimited;

    if (shouldShow && !_portalController.isShowing) {
      _portalController.show();
      _controller.forward();
    } else if (!shouldShow && _portalController.isShowing) {
      _controller.reverse();
    }
  }

  /// Sets up the stream subscription for connectivity status updates
  Future<void> _setupStreamSubscription(
    Stream<ConnectivityState> stream,
  ) async {
    // Cancel existing subscription if any
    await _subscription?.cancel();
    
    // Ensure we're using a broadcast stream
    final Stream<ConnectivityState> broadcastStream =
        stream.isBroadcast ? stream : stream.asBroadcastStream();

    // Set up new subscription
    _subscription = broadcastStream.distinct().listen(
      _updateConnectivityStatus,
      onError: (Object error, StackTrace stackTrace) {
        AppLogger.error(
          'Error in connectivity status stream', 
          error: error,
          stackTrace: stackTrace,
        );
        
        if (_isDisposed) {
          return;
        }

        // Fall back to offline status in case of error
        _updateConnectivityStatus(ConnectivityState.offline);
      },
      // Handle completion (unlikely but good to handle)
      onDone: () {
        AppLogger.debug('Connectivity status stream completed');
        if (!_isDisposed) {
          _initializeConnectivityListener();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => OverlayPortal(
    controller: _portalController,
    overlayChildBuilder: (BuildContext context) => _buildOverlay(),
    child: widget.child,
  );

  /// Builds the overlay UI
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
            child: ConnectivityBanner(status: _currentStatus),
          ),
        ),
      ),
    ),
  );

  @override
  void dispose() {
    _isDisposed = true;
    _controller.removeStatusListener(_handleAnimationStatus);
    unawaited(_subscription?.cancel());
    _controller.dispose();
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<ConnectivityState>(
          'currentStatus',
          _currentStatus,
        ),
      )
      ..add(
        DiagnosticsProperty<bool>(
          'isShowingOverlay',
          _portalController.isShowing,
        ),
      );
  }
}
