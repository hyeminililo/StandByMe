import 'dart:convert';
import 'package:dio/dio.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final int id;
  final String displayname;
  final String email;

  User({
    required this.id,
    required this.displayname,
    required this.email,
  });

  User toMap() {
    return User(
      id: id,
      displayname: displayname,
      email: email,
    );
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      displayname: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
