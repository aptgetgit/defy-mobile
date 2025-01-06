// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TradingPairModel {
  final String token1;
  final String token2;
  final String token1Asset;
  final String token2Asset;
  final String volume;
  final String value;
  final String change;
  TradingPairModel({
    required this.token1,
    required this.token2,
    required this.token1Asset,
    required this.token2Asset,
    required this.volume,
    required this.value,
    required this.change,
  });

  TradingPairModel copyWith({
    String? token1,
    String? token2,
    String? token1Asset,
    String? token2Asset,
    String? volume,
    String? value,
    String? change,
  }) {
    return TradingPairModel(
      token1: token1 ?? this.token1,
      token2: token2 ?? this.token2,
      token1Asset: token1Asset ?? this.token1Asset,
      token2Asset: token2Asset ?? this.token2Asset,
      volume: volume ?? this.volume,
      value: value ?? this.value,
      change: change ?? this.change,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token1': token1,
      'token2': token2,
      'token1Asset': token1Asset,
      'token2Asset': token2Asset,
      'volume': volume,
      'value': value,
      'change': change,
    };
  }

  factory TradingPairModel.fromMap(Map<String, dynamic> map) {
    return TradingPairModel(
      token1: map['token1'] as String,
      token2: map['token2'] as String,
      token1Asset: map['token1Asset'] as String,
      token2Asset: map['token2Asset'] as String,
      volume: map['volume'] as String,
      value: map['value'] as String,
      change: map['change'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TradingPairModel.fromJson(String source) => TradingPairModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TradingPairModel(token1: $token1, token2: $token2, token1Asset: $token1Asset, token2Asset: $token2Asset, volume: $volume, value: $value, change: $change)';
  }

  @override
  bool operator ==(covariant TradingPairModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.token1 == token1 &&
      other.token2 == token2 &&
      other.token1Asset == token1Asset &&
      other.token2Asset == token2Asset &&
      other.volume == volume &&
      other.value == value &&
      other.change == change;
  }

  @override
  int get hashCode {
    return token1.hashCode ^
      token2.hashCode ^
      token1Asset.hashCode ^
      token2Asset.hashCode ^
      volume.hashCode ^
      value.hashCode ^
      change.hashCode;
  }
}

