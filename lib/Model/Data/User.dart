import 'dart:convert';
import 'package:dio/dio.dart';

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

  Member toMap() {
    return Member(
      id: id,
      name: name,
      email: email,
    );
  }

  factory Member.fromJson(Map<String, dynamic> map) {
    return Member(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
