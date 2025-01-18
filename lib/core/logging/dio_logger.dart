import 'dart:math' as math;
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioLogger extends Interceptor {
  DioLogger({
    required this.logger,
    this.request = true,
    this.requestHeader = false,
    this.requestBody = false,
    this.responseHeader = false,
    this.responseBody = true,
    this.error = true,
    this.maxWidth = 90,
    this.compact = true,
    this.logTime = true,
  });
  final Logger logger;
  final bool request;
  final bool requestHeader;
  final bool requestBody;
  final bool responseBody;
  final bool responseHeader;
  final bool error;
  final int maxWidth;
  final bool compact;
  final bool logTime;

  static const int _kInitialTab = 1;
  static const String _tabStep = '    ';
  static const int _chunkSize = 20;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final StringBuffer logBuffer = StringBuffer();
    final DateTime startTime = DateTime.now();
    options.extra['startTime'] = startTime;

    if (request) {
      _addRequestHeaderToBuffer(logBuffer, options);
    }
    if (requestHeader) {
      _addMapAsTableToBuffer(
        logBuffer,
        options.queryParameters,
        header: 'Query Parameters',
      );
      final Map<String, dynamic> requestHeaders = <String, dynamic>{
        ...options.headers,
        'contentType': options.contentType?.toString(),
        'responseType': options.responseType.toString(),
        'followRedirects': options.followRedirects,
        'connectTimeout': options.connectTimeout?.toString(),
        'receiveTimeout': options.receiveTimeout?.toString(),
      };
      _addMapAsTableToBuffer(logBuffer, requestHeaders, header: 'Headers');
      _addMapAsTableToBuffer(logBuffer, options.extra, header: 'Extras');
    }
    if (requestBody && options.method != 'GET') {
      _addRequestBodyToBuffer(logBuffer, options.data);
    }

    logger.d('🌐 Dio Request:\n$logBuffer');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final StringBuffer logBuffer = StringBuffer();
    _addResponseHeaderToBuffer(logBuffer, response);
    if (responseHeader) {
      final Map<String, String> responseHeaders = <String, String>{};
      response.headers.forEach(
        (String k, List<String> list) => responseHeaders[k] = list.toString(),
      );
      _addMapAsTableToBuffer(logBuffer, responseHeaders, header: 'Headers');
    }

    if (responseBody) {
      logBuffer
        ..writeln('╔ Body')
        ..writeln('║');
      _addResponseToBuffer(logBuffer, response);
      logBuffer
        ..writeln('║')
        ..writeln('╚');
    }

    logger.d('🌐 Dio Response:\n$logBuffer');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (error) {
      final StringBuffer logBuffer = StringBuffer();
      if (err.type == DioExceptionType.badResponse) {
        final Uri? uri = err.response?.requestOptions.uri;
        final String? method = err.response?.requestOptions.method;
        _addBoxedToBuffer(
          logBuffer,
          header:
              'DioError ║ $method ║ Status: ${err.response?.statusCode} ${err.response?.statusMessage}',
          text: uri.toString(),
        );
        if (err.response != null && err.response?.data != null) {
          logBuffer.writeln('╔ ${err.type}');
          _addResponseToBuffer(logBuffer, err.response!);
        }
        logBuffer
          ..writeln('╚')
          ..writeln();
      } else {
        _addBoxedToBuffer(
          logBuffer,
          header: 'DioError ║ ${err.type}',
          text: err.message ?? 'No error message',
        );
      }
      logger.e('🌐 Dio Error:\n$logBuffer');
    }
    super.onError(err, handler);
  }

  void _addBoxedToBuffer(StringBuffer buffer, {String? header, String? text}) {
    buffer
      ..writeln()
      ..writeln('╔╣ $header')
      ..writeln('║  $text')
      ..writeln('╚${'═' * maxWidth}');
  }

  void _addRequestBodyToBuffer(StringBuffer buffer, dynamic data) {
    if (data != null) {
      if (data is Map) {
        _addMapAsTableToBuffer(buffer, data, header: 'Body');
      } else if (data is FormData) {
        final Map<String, dynamic> formDataMap = <String, dynamic>{}
          ..addEntries(data.fields)
          ..addEntries(data.files);
        _addMapAsTableToBuffer(
          buffer,
          formDataMap,
          header: 'Form data | ${data.boundary}',
        );
      } else {
        _addBlockToBuffer(buffer, data.toString());
      }
    }
  }

  void _addResponseToBuffer(StringBuffer buffer, Response<dynamic> response) {
    if (response.data != null) {
      if (response.data is Map) {
        _addPrettyMapToBuffer(buffer, response.data as Map<dynamic, dynamic>);
      } else if (response.data is Uint8List) {
        buffer.writeln('║${_indent()}[');
        _addUint8ListToBuffer(buffer, response.data as Uint8List);
        buffer.writeln('║${_indent()}]');
      } else if (response.data is List) {
        buffer.writeln('║${_indent()}[');
        _addListToBuffer(buffer, response.data as List<dynamic>);
        buffer.writeln('║${_indent()}]');
      } else {
        _addBlockToBuffer(buffer, response.data.toString());
      }
    }
  }

  void _addResponseHeaderToBuffer(
    StringBuffer buffer,
    Response<dynamic> response,
  ) {
    final Uri uri = response.requestOptions.uri;
    final String method = response.requestOptions.method;
    final DateTime? requestTime =
        response.requestOptions.extra['startTime'] as DateTime?;
    final DateTime responseTime = DateTime.now();
    final Duration? duration =
        requestTime != null ? responseTime.difference(requestTime) : null;

    final String durationString =
        logTime && duration != null ? ' (${duration.inMilliseconds}ms)' : '';

    _addBoxedToBuffer(
      buffer,
      header:
          'Response ║ $method ║ Status: ${response.statusCode} ${response.statusMessage}$durationString',
      text: uri.toString(),
    );
  }

  void _addRequestHeaderToBuffer(StringBuffer buffer, RequestOptions options) {
    final Uri uri = options.uri;
    final String method = options.method;
    _addBoxedToBuffer(
      buffer,
      header: 'Request ║ $method ',
      text: uri.toString(),
    );
  }

  void _addBlockToBuffer(StringBuffer buffer, String msg) {
    final int lines = (msg.length / maxWidth).ceil();
    for (int i = 0; i < lines; ++i) {
      buffer.writeln(
        '║ ${msg.substring(i * maxWidth, math.min<int>(i * maxWidth + maxWidth, msg.length))}',
      );
    }
  }

  String _indent([int tabCount = _kInitialTab]) => _tabStep * tabCount;

  void _addPrettyMapToBuffer(
    StringBuffer buffer,
    Map<dynamic, dynamic> data, {
    int initialTab = _kInitialTab,
    bool isListItem = false,
    bool isLast = false,
  }) {
    int tabs = initialTab;
    final bool isRoot = tabs == _kInitialTab;
    final String initialIndent = _indent(tabs);
    tabs++;

    if (isRoot || isListItem) {
      buffer.writeln('║$initialIndent{');
    }

    data.keys.toList().asMap().forEach((int index, dynamic key) {
      final bool isLast = index == data.length - 1;
      dynamic value = data[key];
      if (value is String) {
        value = '"${value.replaceAll(RegExp(r'([\r\n])+'), " ")}"';
      }
      if (value is Map) {
        if (compact && _canFlattenMap(value)) {
          buffer.writeln('║${_indent(tabs)} $key: $value${!isLast ? ',' : ''}');
        } else {
          buffer.writeln('║${_indent(tabs)} $key: {');
          _addPrettyMapToBuffer(buffer, value, initialTab: tabs);
        }
      } else if (value is List) {
        if (compact && _canFlattenList(value)) {
          buffer.writeln('║${_indent(tabs)} $key: $value');
        } else {
          buffer.writeln('║${_indent(tabs)} $key: [');
          _addListToBuffer(buffer, value, tabs: tabs);
          buffer.writeln('║${_indent(tabs)} ]${isLast ? '' : ','}');
        }
      } else {
        final String msg = value.toString().replaceAll('\n', '');
        final String indent = _indent(tabs);
        final int linWidth = maxWidth - indent.length;
        if (msg.length + indent.length > linWidth) {
          final int lines = (msg.length / linWidth).ceil();
          for (int i = 0; i < lines; ++i) {
            buffer.writeln(
              '║${_indent(tabs)} ${msg.substring(i * linWidth, math.min<int>(i * linWidth + linWidth, msg.length))}',
            );
          }
        } else {
          buffer.writeln('║${_indent(tabs)} $key: $msg${!isLast ? ',' : ''}');
        }
      }
    });

    buffer.writeln('║$initialIndent}${isListItem && !isLast ? ',' : ''}');
  }

  void _addListToBuffer(
    StringBuffer buffer,
    List<dynamic> list, {
    int tabs = _kInitialTab,
  }) {
    list.asMap().forEach((int i, dynamic e) {
      final bool isLast = i == list.length - 1;
      if (e is Map) {
        if (compact && _canFlattenMap(e)) {
          buffer.writeln('║${_indent(tabs)}  $e${!isLast ? ',' : ''}');
        } else {
          _addPrettyMapToBuffer(
            buffer,
            e,
            initialTab: tabs + 1,
            isListItem: true,
            isLast: isLast,
          );
        }
      } else {
        buffer.writeln('║${_indent(tabs + 2)} $e${isLast ? '' : ','}');
      }
    });
  }

  void _addUint8ListToBuffer(
    StringBuffer buffer,
    Uint8List list, {
    int tabs = _kInitialTab,
  }) {
    final List<Uint8List> chunks = <Uint8List>[];
    for (int i = 0; i < list.length; i += _chunkSize) {
      chunks.add(
        list.sublist(
          i,
          i + _chunkSize > list.length ? list.length : i + _chunkSize,
        ),
      );
    }
    for (final Uint8List element in chunks) {
      buffer.writeln('║${_indent(tabs)} ${element.join(", ")}');
    }
  }

  bool _canFlattenMap(Map<dynamic, dynamic> map) =>
      map.values.where((dynamic val) => val is Map || val is List).isEmpty &&
      map.toString().length < maxWidth;

  bool _canFlattenList(List<dynamic> list) =>
      list.length < 10 && list.toString().length < maxWidth;

  void _addMapAsTableToBuffer(
    StringBuffer buffer,
    Map<dynamic, dynamic>? map, {
    String? header,
  }) {
    if (map == null || map.isEmpty) {
      return;
    }
    buffer.writeln('╔ $header ');
    map.forEach((dynamic key, dynamic value) {
      final String pre = '╟ $key: ';
      final String msg = value.toString();

      if (pre.length + msg.length > maxWidth) {
        buffer.writeln(pre);
        _addBlockToBuffer(buffer, msg);
      } else {
        buffer.writeln('$pre$msg');
      }
    });
    buffer.writeln('╚${'═' * maxWidth}');
  }
}
