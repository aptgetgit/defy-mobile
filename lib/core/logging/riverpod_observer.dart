import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  final bool logAdditions;
  final bool logDisposals;
  final bool logUpdates;
  final bool logErrors;
  final bool logOnlySignificantUpdates;
  final Duration updateFrequencyThreshold;
  final int maxCollectionLogLength;
  final void Function(String message) logger;

  final Map<String, DateTime> _lastUpdateTimes = {};

  ProviderLogger({
    this.logAdditions = true,
    this.logDisposals = true,
    this.logUpdates = true,
    this.logErrors = true,
    this.logOnlySignificantUpdates = true,
    this.updateFrequencyThreshold = const Duration(milliseconds: 500),
    this.maxCollectionLogLength = 5,
    this.logger = print,
  });

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    if (logAdditions) {
      logger('Provider Added: ${_getProviderName(provider)}');
      logger(' Initial Value: ${_formatValue(value)}');
    }
  }

  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    if (logDisposals) {
      logger('Provider Disposed: ${_getProviderName(provider)}');
    }
    _lastUpdateTimes.remove(_getProviderName(provider));
  }

  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    if (logUpdates) {
      final providerName = _getProviderName(provider);
      final now = DateTime.now();
      final lastUpdate = _lastUpdateTimes[providerName];

      if (lastUpdate == null || now.difference(lastUpdate) > updateFrequencyThreshold) {
        if (!logOnlySignificantUpdates || _isSignificantChange(previousValue, newValue)) {
          logger('Provider Updated: $providerName');
          logger(' Previous: ${_formatValue(previousValue)}');
          logger(' New: ${_formatValue(newValue)}');
          logger(' Changed: ${_describeChange(previousValue, newValue)}');
        }
        _lastUpdateTimes[providerName] = now;
      }
    }
  }

  @override
  void providerDidFail(ProviderBase<Object?> provider, Object error, StackTrace stackTrace, ProviderContainer container) {
    if (logErrors) {
      logger('Provider Error: ${_getProviderName(provider)}');
      logger(' Error: $error');
      logger(' Stack Trace:\n$stackTrace');
    }
  }

  String _getProviderName(ProviderBase<Object?> provider) {
    return provider.name ?? provider.runtimeType.toString();
  }

  String _formatValue(Object? value) {
    if (value == null) return 'null';
    if (value is String) return "'$value'";
    if (value is List) {
      return '[${value.take(maxCollectionLogLength).map(_formatValue).join(', ')}${value.length > maxCollectionLogLength ? ', ...' : ''}]';
    }
    if (value is Map) {
      final entries = value.entries.take(maxCollectionLogLength)
          .map((e) => '${_formatValue(e.key)}: ${_formatValue(e.value)}')
          .join(', ');
      return '{$entries${value.length > maxCollectionLogLength ? ', ...' : ''}}';
    }
    return value.toString();
  }

  bool _isSignificantChange(Object? previous, Object? current) {
    if (identical(previous, current)) return false;
    if (previous is List && current is List) {
      return previous.length != current.length || 
             !previous.asMap().entries.every((entry) => entry.value == current[entry.key]);
    }
    if (previous is Map && current is Map) {
      return previous.length != current.length || 
             previous.entries.any((e) => current[e.key] != e.value);
    }
    return previous != current;
  }

  String _describeChange(Object? previous, Object? current) {
    if (identical(previous, current)) return 'No change (identical objects)';
    if (previous == null || current == null) return 'Nullability changed';
    if (previous is List && current is List) {
      if (previous.length != current.length) return 'List length changed from ${previous.length} to ${current.length}';
      final changedIndices = previous.asMap().entries
          .where((entry) => entry.value != current[entry.key])
          .map((e) => e.key)
          .toList();
      return 'List elements changed at indices: $changedIndices';
    }
    if (previous is Map && current is Map) {
      if (previous.length != current.length) return 'Map size changed from ${previous.length} to ${current.length}';
      final changedKeys = previous.keys.where((key) => previous[key] != current[key]).toList();
      return 'Map values changed for keys: $changedKeys';
    }
    return 'Value changed';
  }
}