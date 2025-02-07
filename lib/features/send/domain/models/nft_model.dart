// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:defy/features/send/domain/models/selectable_item_model.dart';

class NFT extends SelectableItem {
  final String assetPath;
  final String nftName;
  final String nftValue;
  final String nftCollection;
  final String nftId;
  NFT({
    required this.assetPath,
    required this.nftName,
    required this.nftValue,
    required this.nftCollection,
    required this.nftId,
  });

  @override
  String get id => nftId;

  @override
  String get name => nftName;

  NFT copyWith({
    String? assetPath,
    String? nftName,
    String? nftValue,
    String? nftCollection,
    String? nftId,
  }) {
    return NFT(
      assetPath: assetPath ?? this.assetPath,
      nftName: nftName ?? this.nftName,
      nftValue: nftValue ?? this.nftValue,
      nftCollection: nftCollection ?? this.nftCollection,
      nftId: nftId ?? this.nftId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'assetPath': assetPath,
      'nftName': nftName,
      'nftValue': nftValue,
      'nftCollection': nftCollection,
      'nftId': nftId,
    };
  }

  factory NFT.fromMap(Map<String, dynamic> map) {
    return NFT(
      assetPath: map['assetPath'] as String,
      nftName: map['nftName'] as String,
      nftValue: map['nftValue'] as String,
      nftCollection: map['nftCollection'] as String,
      nftId: map['nftId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NFT.fromJson(String source) =>
      NFT.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NFT(assetPath: $assetPath, nftName: $nftName, nftValue: $nftValue, nftCollection: $nftCollection, nftId: $nftId)';
  }

  @override
  bool operator ==(covariant NFT other) {
    if (identical(this, other)) return true;

    return other.assetPath == assetPath &&
        other.nftName == nftName &&
        other.nftValue == nftValue &&
        other.nftCollection == nftCollection &&
        other.nftId == nftId;
  }

  @override
  int get hashCode {
    return assetPath.hashCode ^
        nftName.hashCode ^
        nftValue.hashCode ^
        nftCollection.hashCode ^
        nftId.hashCode;
  }
}
