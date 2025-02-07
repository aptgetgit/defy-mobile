// ignore_for_file: public_member_api_docs, sort_constructors_first


part of '../../presentation/providers/send_provider.dart';



class Contact implements SelectableItem {
  final String? avatar;
  final String contactName;
  final String contact;

  Contact({
    this.avatar,
    required this.contactName,
    required this.contact,
  });

  @override
  String get id => contact;

  @override
  String get name => contactName;

  Contact copyWith({
    String? avatar,
    String? contactName,
    String? contact,
  }) {
    return Contact(
      avatar: avatar ?? this.avatar,
      contactName: contactName ?? this.contactName,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatar': avatar,
      'contactName': contactName,
      'contact': contact,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      contactName: map['contactName'] as String,
      contact: map['contact'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) => Contact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Contact(avatar: $avatar, contactName: $contactName, contact: $contact)';

  @override
  bool operator ==(covariant Contact other) {
    if (identical(this, other)) return true;
  
    return 
      other.avatar == avatar &&
      other.contactName == contactName &&
      other.contact == contact;
  }

  @override
  int get hashCode => avatar.hashCode ^ contactName.hashCode ^ contact.hashCode;
}
