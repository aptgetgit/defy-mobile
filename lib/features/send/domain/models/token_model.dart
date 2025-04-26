import 'dart:convert';

import 'selectable_item_model.dart';

class Token implements SelectableItem {
  final String? tokenName;
  final String? tokenSymbol;
  final String? tokenAddress;
  final String? tokenImage;
  final String? tokenBalance;
  final String? tokenPrice;
  Token({
    required this.tokenName,
    required this.tokenSymbol,
    this.tokenAddress,
    required this.tokenImage,
    required this.tokenBalance,
    required this.tokenPrice,
  });

  Token copyWith({
    String? tokenName,
    String? tokenSymbol,
    String? tokenAddress,
    String? tokenImage,
    String? tokenBalance,
    String? tokenPrice,
  }) {
    return Token(
      tokenName: tokenName ?? this.tokenName,
      tokenSymbol: tokenSymbol ?? this.tokenSymbol,
      tokenAddress: tokenAddress ?? this.tokenAddress,
      tokenImage: tokenImage ?? this.tokenImage,
      tokenBalance: tokenBalance ?? this.tokenBalance,
      tokenPrice: tokenPrice ?? this.tokenPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tokenName': tokenName,
      'tokenSymbol': tokenSymbol,
      'tokenAddress': tokenAddress,
      'tokenImage': tokenImage,
      'tokenBalance': tokenBalance,
      'tokenPrice': tokenPrice,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      tokenName: map['tokenName'] as String,
      tokenSymbol: map['tokenSymbol'] as String,
      tokenAddress: map['tokenAddress'] as String,
      tokenImage: map['tokenImage'] as String,
      tokenBalance: map['tokenBalance'] as String,
      tokenPrice: map['tokenPrice'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) =>
      Token.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Token(tokenName: $tokenName, tokenSymbol: $tokenSymbol, tokenAddress: $tokenAddress, tokenImage: $tokenImage, tokenBalance: $tokenBalance, tokenPrice: $tokenPrice)';
  }

  @override
  bool operator ==(covariant Token other) {
    if (identical(this, other)) return true;

    return other.tokenName == tokenName &&
        other.tokenSymbol == tokenSymbol &&
        other.tokenAddress == tokenAddress &&
        other.tokenImage == tokenImage &&
        other.tokenBalance == tokenBalance &&
        other.tokenPrice == tokenPrice;
  }

  @override
  int get hashCode {
    return tokenName.hashCode ^
        tokenSymbol.hashCode ^
        tokenAddress.hashCode ^
        tokenImage.hashCode ^
        tokenBalance.hashCode ^
        tokenPrice.hashCode;
  }

  @override
  String get id => tokenSymbol!;

  @override
  String get name => tokenName!;
}
