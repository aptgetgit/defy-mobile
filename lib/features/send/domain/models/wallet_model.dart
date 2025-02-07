
part of '../../presentation/providers/send_provider.dart';

class Wallet implements SelectableItem {
  final String asset;
  final String walletName;
  final String balance;

  Wallet({
    required this.asset,
    required this.walletName,
    required this.balance,
  });

  @override
  String get id => walletName;

  @override
  String get name => walletName;

  Wallet copyWith({
    String? asset,
    String? walletName,
    String? balance,
  }) {
    return Wallet(
      asset: asset ?? this.asset,
      walletName: walletName ?? this.walletName,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'asset': asset,
      'walletName': walletName,
      'balance': balance,
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      asset: map['asset'] as String,
      walletName: map['walletName'] as String,
      balance: map['balance'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet.fromJson(String source) => Wallet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Wallet(asset: $asset, walletName: $walletName, balance: $balance)';

  @override
  bool operator ==(covariant Wallet other) {
    if (identical(this, other)) return true;
  
    return 
      other.asset == asset &&
      other.walletName == walletName &&
      other.balance == balance;
  }

  @override
  int get hashCode => asset.hashCode ^ walletName.hashCode ^ balance.hashCode;
}
