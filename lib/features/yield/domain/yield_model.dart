// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:defy/features/yield/domain/single_or_multi_abstract_class.dart';

class YieldMultiModel extends SingleOrMultiAbstractClass {
  final String token1;
  final String token2;
  final String token1Asset;
  final String token2Asset;
  final String apr;
  final String tvl;
  final String variableOrFixed;
  YieldMultiModel({
    required this.token1,
    required this.token2,
    required this.token1Asset,
    required this.token2Asset,
    required this.apr,
    required this.tvl,
    required this.variableOrFixed,
  });

  YieldMultiModel copyWith({
    String? token1,
    String? token2,
    String? token1Asset,
    String? token2Asset,
    String? apr,
    String? tvl,
    String? variableOrFixed,
  }) {
    return YieldMultiModel(
      token1: token1 ?? this.token1,
      token2: token2 ?? this.token2,
      token1Asset: token1Asset ?? this.token1Asset,
      token2Asset: token2Asset ?? this.token2Asset,
      apr: apr ?? this.apr,
      tvl: tvl ?? this.tvl,
      variableOrFixed: variableOrFixed ?? this.variableOrFixed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token1': token1,
      'token2': token2,
      'token1Asset': token1Asset,
      'token2Asset': token2Asset,
      'apr': apr,
      'tvl': tvl,
      'variableOrFixed': variableOrFixed,
    };
  }

  factory YieldMultiModel.fromMap(Map<String, dynamic> map) {
    return YieldMultiModel(
      token1: map['token1'] as String,
      token2: map['token2'] as String,
      token1Asset: map['token1Asset'] as String,
      token2Asset: map['token2Asset'] as String,
      apr: map['apr'] as String,
      tvl: map['tvl'] as String,
      variableOrFixed: map['variableOrFixed'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory YieldMultiModel.fromJson(String source) =>
      YieldMultiModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'YieldMultiModel(token1: $token1, token2: $token2, token1Asset: $token1Asset, token2Asset: $token2Asset, apr: $apr, tvl: $tvl, variableOrFixed: $variableOrFixed)';
  }

  @override
  bool operator ==(covariant YieldMultiModel other) {
    if (identical(this, other)) return true;

    return other.token1 == token1 &&
        other.token2 == token2 &&
        other.token1Asset == token1Asset &&
        other.token2Asset == token2Asset &&
        other.apr == apr &&
        other.tvl == tvl &&
        other.variableOrFixed == variableOrFixed;
  }

  @override
  int get hashCode {
    return token1.hashCode ^
        token2.hashCode ^
        token1Asset.hashCode ^
        token2Asset.hashCode ^
        apr.hashCode ^
        tvl.hashCode ^
        variableOrFixed.hashCode;
  }

  @override
  String? get name => '$token1-$token2';

  @override
  String? get aprPercentage => '$apr%';
}

class YieldSingleModel extends SingleOrMultiAbstractClass {
  final String token;
  final String tokenAsset;
  final String apr;
  final String tvl;
  final String variableOrFixed;
  YieldSingleModel({
    required this.token,
    required this.tokenAsset,
    required this.apr,
    required this.tvl,
    required this.variableOrFixed,
  });

  YieldSingleModel copyWith({
    String? token,
    String? tokenAsset,
    String? apr,
    String? tvl,
    String? variableOrFixed,
  }) {
    return YieldSingleModel(
      token: token ?? this.token,
      tokenAsset: tokenAsset ?? this.tokenAsset,
      apr: apr ?? this.apr,
      tvl: tvl ?? this.tvl,
      variableOrFixed: variableOrFixed ?? this.variableOrFixed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'tokenAsset': tokenAsset,
      'apr': apr,
      'tvl': tvl,
      'variableOrFixed': variableOrFixed,
    };
  }

  factory YieldSingleModel.fromMap(Map<String, dynamic> map) {
    return YieldSingleModel(
      token: map['token'] as String,
      tokenAsset: map['tokenAsset'] as String,
      apr: map['apr'] as String,
      tvl: map['tvl'] as String,
      variableOrFixed: map['variableOrFixed'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory YieldSingleModel.fromJson(String source) =>
      YieldSingleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'YieldSingleModel(token: $token, tokenAsset: $tokenAsset, apr: $apr, tvl: $tvl, variableOrFixed: $variableOrFixed)';
  }

  @override
  bool operator ==(covariant YieldSingleModel other) {
    if (identical(this, other)) return true;

    return other.token == token &&
        other.tokenAsset == tokenAsset &&
        other.apr == apr &&
        other.tvl == tvl &&
        other.variableOrFixed == variableOrFixed;
  }

  @override
  int get hashCode {
    return token.hashCode ^
        tokenAsset.hashCode ^
        apr.hashCode ^
        tvl.hashCode ^
        variableOrFixed.hashCode;
  }

  @override
  String? get aprPercentage => '$apr%';

  @override
  String? get name => token;
}
