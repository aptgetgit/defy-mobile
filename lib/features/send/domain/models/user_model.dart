// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'selectable_item_model.dart';


class UserModel implements SelectableItem {
  final String asset;
  final String userName;
  final String walletAddress;
  UserModel({
    required this.asset,
    required this.userName,
    required this.walletAddress,
  });
  
  @override
  String get id => walletAddress;
  
  @override
  String get name => userName;

  UserModel copyWith({
    String? asset,
    String? userName,
    String? walletAddress,
  }) {
    return UserModel(
      asset: asset ?? this.asset,
      userName: userName ?? this.userName,
      walletAddress: walletAddress ?? this.walletAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'asset': asset,
      'userName': userName,
      'walletAddress': walletAddress,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      asset: map['asset'] as String,
      userName: map['userName'] as String,
      walletAddress: map['walletAddress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(asset: $asset, userName: $userName, walletAddress: $walletAddress)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.asset == asset &&
      other.userName == userName &&
      other.walletAddress == walletAddress;
  }

  @override
  int get hashCode => asset.hashCode ^ userName.hashCode ^ walletAddress.hashCode;
}
