import 'dart:async';
import 'package:lru_cache/lru_cache.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../account/domain/entities/account_address.dart';
import '../../domain/entities/account_data.dart';
import '../../domain/repositories/node_repository.dart';
import 'node_usecase_provider.dart';

part 'generated/account_data_notifier_provider.g.dart';

@Riverpod(keepAlive: true)
class AccountDataNotifier extends _$AccountDataNotifier {
  late final INodeRepository _repository;
  late final LruCache<AccountAddress, AccountData> _cache;
  Timer? _refreshTimer;
  Completer<void>? _activeRefresh;
  bool _disposed = false;

  static const Duration _refreshInterval = Duration(seconds: 30);

  @override
  Future<void> build() async {
    _repository = ref.read(nodeRepositoryProvider);
    _cache = LruCache<AccountAddress, AccountData>(50);

    ref.onDispose(() {
      _disposed = true;
      _cancelTimer();
    });

    final List<(AccountAddress, AccountData)> storedAccounts =
        await _repository.getAllLocalAccountData();

    storedAccounts.sort(
      ((AccountAddress, AccountData) a, (AccountAddress, AccountData) b) =>
          b.$2.sequenceNumber.compareTo(a.$2.sequenceNumber),
    );

    for (final (AccountAddress accountAddress, AccountData account)
        in storedAccounts.take(50)) {
      await _cache.put(accountAddress, account);
    }
  }

  void _cancelTimer() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
  }

  Future<AccountData> getAccountData(AccountAddress address) async {
    if (_disposed) {
      throw StateError('Notifier has been disposed');
    }

    final AccountData? cached = await _cache.get(address);
    if (cached != null) {
      unawaited(_backgroundRefresh(address));
      return cached;
    }

    final AccountData data = await _fetchAndCache(address);
    _setupRefreshTimer(address);
    return data;
  }

  Future<AccountData> _fetchAndCache(AccountAddress address) async {
    final AccountData data =
        await _repository.fetchAccountData(accountAddress: address);

    if (!_disposed) {
      unawaited(_cache.put(address, data));
      await _repository.saveAccountData(
        accountAddress: address,
        data: data,
      );
    }

    return data;
  }

  Future<void> _backgroundRefresh(AccountAddress address) async {
    if (_activeRefresh?.isCompleted == false) {
      return;
    }

    final Completer<void> completer = Completer<void>();
    _activeRefresh = completer;

    try {
      final AccountData newData =
          await _repository.fetchAccountData(accountAddress: address);

      if (_disposed) {
        return;
      }

      final AccountData? currentData = await _cache.get(address);
      if (currentData != null &&
          currentData.sequenceNumber != newData.sequenceNumber) {
        await _cache.put(address, newData);
        await _repository.saveAccountData(
          accountAddress: address,
          data: newData,
        );
      }
    } on Exception catch (e) {
      // print('Background refresh failed: $e');
    } finally {
      completer.complete();
    }
  }

  void _setupRefreshTimer(AccountAddress address) {
    _cancelTimer();
    if (!_disposed) {
      _refreshTimer = Timer.periodic(_refreshInterval, (_) {
        unawaited(_backgroundRefresh(address));
      });
    }
  }

  Future<AccountData> forceRefresh(AccountAddress address) async {
    if (_disposed) {
      throw StateError('Cannot force refresh from disposed notifier');
    }

    final AccountData data = await _fetchAndCache(address);
    return data;
  }

  void startPeriodicRefresh(AccountAddress address) {
    if (!_disposed) {
      _setupRefreshTimer(address);
    }
  }

  void stopPeriodicRefresh() {
    _cancelTimer();
  }
}
