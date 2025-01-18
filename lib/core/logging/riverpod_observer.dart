import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class ProviderLogger extends ProviderObserver {
  ProviderLogger({
    required this.logger,
    this.logAdditions = true,
    this.logDisposals = true,
    this.logUpdates = true,
    this.logErrors = true,
    this.logOnlySignificantUpdates = true,
    this.updateFrequencyThreshold = const Duration(milliseconds: 500),
    this.maxCollectionLogLength = 5,
  });
  final bool logAdditions;
  final bool logDisposals;
  final bool logUpdates;
  final bool logErrors;
  final bool logOnlySignificantUpdates;
  final Duration updateFrequencyThreshold;
  final int maxCollectionLogLength;
  final Logger logger;

  final Map<String, DateTime> _lastUpdateTimes = <String, DateTime>{};

  void _logBlock(
    String title,
    List<String> lines, {
    Level level = Level.debug,
  }) {
    final StringBuffer buffer = StringBuffer()
      ..writeln('🔍 $title')
      ..writeln('╔${'═' * 78}');
    for (final String line in lines) {
      buffer.writeln('║ $line');
    }
    buffer.writeln('╚${'═' * 78}');

    logger.log(level, buffer.toString());
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (logAdditions) {
      _logBlock(
        'Provider Added: ${_getProviderName(provider)}',
        <String>[
          'Initial Value: ${_formatValue(value)}',
        ],
        level: Level.info,
      );
    }
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    if (logDisposals) {
      _logBlock(
        'Provider Disposed',
        <String>[
          _getProviderName(provider),
        ],
        level: Level.info,
      );
    }
    _lastUpdateTimes.remove(_getProviderName(provider));
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (logUpdates) {
      final String providerName = _getProviderName(provider);
      final DateTime now = DateTime.now();
      final DateTime? lastUpdate = _lastUpdateTimes[providerName];

      if (lastUpdate == null ||
          now.difference(lastUpdate) > updateFrequencyThreshold) {
        if (!logOnlySignificantUpdates ||
            _isSignificantChange(previousValue, newValue)) {
          _logBlock(
            'Provider Updated: $providerName',
            <String>[
              'Previous: ${_formatValue(previousValue)}',
              'New: ${_formatValue(newValue)}',
              'Changed: ${_describeChange(previousValue, newValue)}',
            ],
          );
        }
        _lastUpdateTimes[providerName] = now;
      }
    }
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    if (logErrors) {
      _logBlock(
        'Provider Error: ${_getProviderName(provider)}',
        <String>[
          'Error: $error',
          'Stack Trace:',
          ...stackTrace.toString().split('\n').take(10),
          if (stackTrace.toString().split('\n').length > 10) '...',
        ],
        level: Level.error,
      );
    }
  }

  String _getProviderName(ProviderBase<Object?> provider) =>
      provider.name ?? provider.runtimeType.toString();

  String _formatValue(Object? value) {
    if (value == null) {
      return 'null';
    }
    if (value is String) {
      return "'$value'";
    }
    if (value is List) {
      return '[${value.take(maxCollectionLogLength).map(_formatValue).join(', ')}${value.length > maxCollectionLogLength ? ', ...' : ''}]';
    }
    if (value is Map) {
      final String entries = value.entries
          .take(maxCollectionLogLength)
          .map(
            (MapEntry<dynamic, dynamic> e) =>
                '${_formatValue(e.key)}: ${_formatValue(e.value)}',
          )
          .join(', ');
      return '{$entries${value.length > maxCollectionLogLength ? ', ...' : ''}}';
    }
    return value.toString();
  }

  bool _isSignificantChange(Object? previous, Object? current) {
    if (identical(previous, current)) {
      return false;
    }
    if (previous is List && current is List) {
      return previous.length != current.length ||
          !previous.asMap().entries.every(
                (MapEntry<int, dynamic> entry) =>
                    entry.value == current[entry.key],
              );
    }
    if (previous is Map && current is Map) {
      return previous.length != current.length ||
          previous.entries
              .any((MapEntry<dynamic, dynamic> e) => current[e.key] != e.value);
    }
    return previous != current;
  }

  String _describeChange(Object? previous, Object? current) {
    if (identical(previous, current)) {
      return 'No change (identical objects)';
    }
    if (previous == null || current == null) {
      return 'Nullability changed';
    }
    if (previous is List && current is List) {
      if (previous.length != current.length) {
        return 'List length changed from ${previous.length} to ${current.length}';
      }
      final List<int> changedIndices = previous
          .asMap()
          .entries
          .where(
            (MapEntry<int, dynamic> entry) => entry.value != current[entry.key],
          )
          .map((MapEntry<int, dynamic> e) => e.key)
          .toList();
      return 'List elements changed at indices: $changedIndices';
    }
    if (previous is Map && current is Map) {
      if (previous.length != current.length) {
        return 'Map size changed from ${previous.length} to ${current.length}';
      }
      final List<dynamic> changedKeys = previous.keys
          .where((dynamic key) => previous[key] != current[key])
          .toList();
      return 'Map values changed for keys: $changedKeys';
    }
    return 'Value changed';
  }
}
