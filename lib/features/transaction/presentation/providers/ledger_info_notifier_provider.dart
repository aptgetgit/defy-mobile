import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/node_repository_implementation.dart';
import '../../domain/entities/ledger_info.dart';
import 'node_usecase_provider.dart';

part 'generated/ledger_info_notifier_provider.g.dart';

@Riverpod(keepAlive: true)
class LedgerInfoNotifier extends _$LedgerInfoNotifier {
  NodeRepository get _repository => ref.read(nodeRepositoryProvider);
  Timer? _refreshTimer;

  static const Duration _refreshInterval = Duration(minutes: 5);
  static const Duration _minRefreshInterval = Duration(seconds: 30);
  static const Duration _maxRefreshInterval = Duration(minutes: 30);

  bool _disposed = false;
  Completer<void>? _activeRefresh;

  @override
  Future<LedgerInfo> build() async {
    ref.onDispose(() {
      _disposed = true;
      _cancelTimer();
    });

    final LedgerInfo initialData = await _fetchLedgerInfo();
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

  Future<LedgerInfo> _fetchLedgerInfo() async {
    try {
      return await _repository.fetchLedgerInfo();
    } on Exception catch (e, stack) {
      if (!_disposed) {
        state = AsyncError<LedgerInfo>(e, stack);
      }
      return Future<LedgerInfo>.error(e, stack);
    }
  }

  Future<void> _backgroundRefresh() async {
    if (_activeRefresh?.isCompleted == false) {
      return;
    }
    final Completer<void> completer = Completer<void>();
    _activeRefresh = completer;

    try {
      final LedgerInfo newInfo = await _fetchLedgerInfo();
      if (_disposed) {
        return;
      }

      state = switch (state) {
        AsyncData<LedgerInfo>(value: final LedgerInfo currentInfo) =>
          _shouldUpdate(currentInfo, newInfo)
              ? AsyncData<LedgerInfo>(newInfo)
              : state,
        _ => AsyncData<LedgerInfo>(
            newInfo,
          )
      };
    } on Exception catch (e, stack) {
      if (_disposed) {
        return;
      }

      state = switch (state) {
        AsyncData<LedgerInfo>() => state,
        _ => AsyncError<LedgerInfo>(e, stack)
      };
    } finally {
      completer.complete();
    }
  }

  bool _shouldUpdate(LedgerInfo current, LedgerInfo updated) =>
      current.ledgerVersion != updated.ledgerVersion ||
      current.chainId != updated.chainId ||
      current.epoch != updated.epoch;


  Future<LedgerInfo> getWithBackgroundRefresh() async {
    if (_disposed) {
      throw StateError('Notifier has been disposed');
    }

    return state.when(
      data: (LedgerInfo info) {
        unawaited(_backgroundRefresh());
        return info;
      },
      error: (_, __) => _fetchLedgerInfo(),
      loading: _fetchLedgerInfo,
    );
  }

  Future<LedgerInfo> forceRefresh() async {
    if (_disposed) {
      throw StateError('Notifier has been disposed');
    }

    final LedgerInfo newInfo = await _fetchLedgerInfo();
    if (!_disposed) {
      state = AsyncData<LedgerInfo>(newInfo);
    }
    return newInfo;
  }

  void startPeriodicRefresh() {
    if (!_disposed) {
      _setupPeriodicRefresh();
    }
  }

  void stopPeriodicRefresh() {
    _cancelTimer();
  }

  void setRefreshInterval(Duration interval) {
    if (_disposed) {
      return;
    }

    final Duration safeInterval = Duration(
      milliseconds: interval.inMilliseconds.clamp(
        _minRefreshInterval.inMilliseconds,
        _maxRefreshInterval.inMilliseconds,
      ),
    );

    _cancelTimer();
    if (!_disposed) {
      _refreshTimer = Timer.periodic(safeInterval, (_) {
        unawaited(_backgroundRefresh());
      });
    }
  }

  bool isPeriodicRefreshActive() => _refreshTimer != null && !_disposed;

  void dispose() {
    _disposed = true;
    _cancelTimer();
  }
}
