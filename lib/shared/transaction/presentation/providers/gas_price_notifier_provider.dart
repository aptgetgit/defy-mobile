import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/node_repository_implementation.dart';
import '../../domain/entities/gas_price_estimate.dart';
import 'node_usecase_provider.dart';

part 'generated/gas_price_notifier_provider.g.dart';

@Riverpod(keepAlive: true)
class GasPriceNotifier extends _$GasPriceNotifier {
  NodeRepository get _repository => ref.read(nodeRepositoryProvider);
  Timer? _refreshTimer;
  static const Duration _refreshInterval = Duration(seconds: 60);

  Completer<void>? _activeRefresh;
  bool _disposed = false;

  @override
  Future<GasPriceEstimate> build() async {
    ref.onDispose(() {
      _disposed = true;
      _cancelTimer();
    });

    final GasPriceEstimate initialData = await _fetchGasPrice();
    if (!_disposed) {
      _setupPeriodicRefresh();
    }
    return initialData;
  }

  void _cancelTimer() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
  }

  void _setupPeriodicRefresh() {
    _cancelTimer();
    if (!_disposed) {
      _refreshTimer = Timer.periodic(_refreshInterval, (_) {
        unawaited(_backgroundRefresh());
      });
    }
  }

  Future<GasPriceEstimate> _fetchGasPrice() async {
    try {
      return await _repository.fetchGasPriceEstimate();
    } on Exception catch (e, stack) {
      if (!_disposed) {
        state = AsyncError<GasPriceEstimate>(e, stack);
      }
      return Future<GasPriceEstimate>.error(e, stack);
    }
  }

  Future<void> _backgroundRefresh() async {
    if (_activeRefresh?.isCompleted == false) {
      return;
    }
    final Completer<void> completer = Completer<void>();
    _activeRefresh = completer;

    try {
      final GasPriceEstimate newPrice = await _fetchGasPrice();
      if (_disposed) {
        return;
      }

      state = switch (state) {
        AsyncData<GasPriceEstimate>(
          value: final GasPriceEstimate currentPrice
        ) =>
          _shouldUpdate(currentPrice, newPrice)
              ? AsyncData<GasPriceEstimate>(newPrice)
              : state,
        _ => AsyncData<GasPriceEstimate>(newPrice)
      };
    } on Exception catch (e, stack) {
      if (_disposed) {
        return;
      }

      state = switch (state) {
        AsyncData<GasPriceEstimate>() => state, // Keep existing data
        _ => AsyncError<GasPriceEstimate>(e, stack)
      };
    } finally {
      completer.complete();
    }
  }

  bool _shouldUpdate(GasPriceEstimate current, GasPriceEstimate updated) =>
      current.gasEstimate != updated.gasEstimate ||
      current.deprioritizedGasEstimate != updated.deprioritizedGasEstimate ||
      current.prioritizedGasEstimate != updated.prioritizedGasEstimate;

  Future<GasPriceEstimate> getWithBackgroundRefresh() async {
    if (_disposed) {
      throw StateError('Cannot get data from disposed notifier');
    }

    return state.when(
      data: (GasPriceEstimate price) {
        unawaited(_backgroundRefresh());
        return price;
      },
      error: (_, __) => _fetchGasPrice(),
      loading: _fetchGasPrice,
    );
  }

  Future<GasPriceEstimate> forceRefresh() async {
    if (_disposed) {
      throw StateError('Cannot force refresh from disposed notifier');
    }

    final GasPriceEstimate newPrice = await _fetchGasPrice();
    if (!_disposed) {
      state = AsyncData<GasPriceEstimate>(newPrice);
    }
    return newPrice;
  }

  void startPeriodicRefresh() {
    if (!_disposed) {
      _setupPeriodicRefresh();
    }
  }

  void stopPeriodicRefresh() {
    _cancelTimer();
  }

  bool isPeriodicRefreshActive() => _refreshTimer != null && !_disposed;
}
