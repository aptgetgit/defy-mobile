class SendProfileEntity {
  final String? assetUrl;
  final String? name;
  final String? userName;
  final String? walletAddress;
  bool isSelected;
  SendProfileEntity({
    required this.assetUrl,
    required this.name,
    required this.userName,
    required this.walletAddress,
    this.isSelected = false,
  });
 
  SendProfileEntity copyWith({
    String? assetUrl,
   String? name,
   String? userName,
   String? walletAddress,
  bool isSelected = false,
  }) {
    return SendProfileEntity(
      assetUrl : assetUrl ?? this.assetUrl,
      name : name ?? this.name,
      userName : userName ?? this.userName,
      walletAddress : walletAddress ?? this.walletAddress,
      isSelected : isSelected,
    );
  }
}