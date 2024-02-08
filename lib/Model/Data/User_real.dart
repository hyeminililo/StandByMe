import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Member {
  final int id;
  final String name;
  final String email;

  Member({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
