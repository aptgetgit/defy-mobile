// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:defy/features/blockchain/presentation/providers/states/card_color.dart';

enum NewWalletCreationType { seed, privateKey }

class NewWalletData {
  final String personaName;
  final String shareId;
  final String name;
  final String balance;
  final String? iconUrl;
  CardColor cardColor;
  final NewWalletCreationType type;
  NewWalletData({
    required this.personaName,
    required this.shareId,
    required this.name,
    required this.balance,
    this.iconUrl,
    required this.cardColor,
    this.type = NewWalletCreationType.seed,
  });

  NewWalletData copyWith({
    String? personaName,
    String? shareId,
    String? name,
    String? balance,
    String? iconUrl,
    CardColor? cardColor,
    NewWalletCreationType? type,
  }) {
    return NewWalletData(
      personaName: personaName ?? this.personaName,
      shareId: shareId ?? this.shareId,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      iconUrl: iconUrl ?? this.iconUrl,
      cardColor: cardColor ?? this.cardColor,
      type: type ?? this.type,
    );
  }

  @override
  String toString() {
    return 'NewWalletData(personaName: $personaName, shareId: $shareId, name: $name, balance: $balance, iconUrl: $iconUrl, cardColor: $cardColor, type: $type)';
  }
}
