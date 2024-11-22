// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_blockchain_account_group_assignment_remote_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _UserBlockchainAccountGroupAssignmentRemoteDataSource
    implements UserBlockchainAccountGroupAssignmentRemoteDataSource {
  _UserBlockchainAccountGroupAssignmentRemoteDataSource(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  });

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApiResponse<List<UserBlockchainAccountRemoteModel>>>
      listUserBlockchainAccountGroupAssignments(
          String blockchainAccountGroupId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiResponse<List<UserBlockchainAccountRemoteModel>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/v1/blockchain-account-groups/${blockchainAccountGroupId}/blockchain-accounts',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<List<UserBlockchainAccountRemoteModel>> _value;
    try {
      _value = ApiResponse<List<UserBlockchainAccountRemoteModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<UserBlockchainAccountRemoteModel>((i) =>
                    UserBlockchainAccountRemoteModel.fromJson(
                        i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponse<UserBlockchainAccountRemoteModel>>
      getUserBlockchainAccountGroupAssignment(
    String blockchainAccountGroupId,
    String blockchainAccountId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiResponse<UserBlockchainAccountRemoteModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v1/blockchain-account-groups/${blockchainAccountGroupId}/blockchain-accounts/${blockchainAccountId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<UserBlockchainAccountRemoteModel> _value;
    try {
      _value = ApiResponse<UserBlockchainAccountRemoteModel>.fromJson(
        _result.data!,
        (json) => UserBlockchainAccountRemoteModel.fromJson(
            json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponse<UserBlockchainAccountRemoteModel>>
      updateUserBlockchainAccountGroupAssignment(
    String blockchainAccountGroupId,
    String blockchainAccountId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiResponse<UserBlockchainAccountRemoteModel>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v1/blockchain-account-groups/${blockchainAccountGroupId}/blockchain-accounts/${blockchainAccountId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<UserBlockchainAccountRemoteModel> _value;
    try {
      _value = ApiResponse<UserBlockchainAccountRemoteModel>.fromJson(
        _result.data!,
        (json) => UserBlockchainAccountRemoteModel.fromJson(
            json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> deleteUserBlockchainAccountGroupAssignment(
    String blockchainAccountGroupId,
    String blockchainAccountId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/v1/blockchain-account-groups/${blockchainAccountGroupId}/blockchain-accounts/${blockchainAccountId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    await _dio.fetch<void>(_options);
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
