import 'dart:convert';

import 'package:defy/core/logging/app_logger.dart';

enum AuthErrorType {
  missingDisplayName,
  missingUsername,
  generalAuthError,
}

class AuthErrorHandler {
  static AuthErrorType parseAuthError(dynamic errorResponse) {
    try {
      final errRes = _convertToMap(errorResponse);
      AppLogger.debug(errRes);
      final nodes = errRes['ui']?['nodes'];

      if (nodes != null && nodes is List) {
        for(var node in nodes) {
          for (var message in node['messages']) {
          if (message['id'] == 4000002 &&
              message['context']?['property'] == 'username') {
            return AuthErrorType.missingUsername;
          } else if (message['id'] == 4000002 &&
              message['context']?['property'] == 'displayName') {
            return AuthErrorType.missingDisplayName;
          }
        }
        }
      }
    } catch (e) {
      return AuthErrorType.generalAuthError;
    }
    return AuthErrorType.generalAuthError;
  }

  static Map<String, dynamic> _convertToMap(dynamic errorResponse) {
    if (errorResponse is Map<String, dynamic>) {
      return errorResponse;
    }
    try {
      return Map<String, dynamic>.from(json.decode(errorResponse.toString()));
    } catch (e) {
      AppLogger.debug(e.toString());
      rethrow;
    }
  }
}
