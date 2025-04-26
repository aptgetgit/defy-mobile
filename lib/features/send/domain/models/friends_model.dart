part of '../../presentation/providers/send_provider.dart';

class Friend implements SelectableItem {
  final String? avatar;
  final String friendName;
  final String defyId;

  Friend({
    this.avatar,
    required this.friendName,
    required this.defyId,
  });

  @override
  String get id => defyId;

  @override
  String get name => friendName;

  Friend copyWith({
    String? avatar,
    String? friendName,
    String? defyId,
  }) {
    return Friend(
      avatar: avatar ?? this.avatar,
      friendName: friendName ?? this.friendName,
      defyId: defyId ?? this.defyId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatar': avatar,
      'friendName': friendName,
      'defyId': defyId,
    };
  }

  factory Friend.fromMap(Map<String, dynamic> map) {
    return Friend(
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      friendName: map['friendName'] as String,
      defyId: map['defyId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Friend.fromJson(String source) => Friend.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Friend(avatar: $avatar, friendName: $friendName, defyId: $defyId)';

  @override
  bool operator ==(covariant Friend other) {
    if (identical(this, other)) return true;
  
    return 
      other.avatar == avatar &&
      other.friendName == friendName &&
      other.defyId == defyId;
  }

  @override
  int get hashCode => avatar.hashCode ^ friendName.hashCode ^ defyId.hashCode;
}
