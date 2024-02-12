import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserInfo {
  final int id;
  final String displayname;
  final String email;

  UserInfo({
    required this.id,
    required this.displayname,
    required this.email,
  });

  UserInfo toMap() {
    return UserInfo(
      id: id,
      displayname: displayname,
      email: email,
    );
  }

  factory UserInfo.fromJson(Map<String, dynamic> map) {
    return UserInfo(
      id: map['id'] as int,
      displayname: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
