// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class UserInfo extends ChangeNotifier {
  int? _id;
  String? _displayName;
  String? _email;

  UserInfo({
    required int? id,
    required String? displayName,
    required String? email,
  })  : _id = id,
        _displayName = displayName,
        _email = email;

  int? get id => _id;
  set id(int? value) {
    _id = value;
    notifyListeners();
  }

  String? get displayName => _displayName;
  set displayName(String? value) {
    _displayName = value;
    notifyListeners();
  }

  String? get email => _email;
  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  UserInfo toMap() {
    return UserInfo(
      id: _id,
      displayName: _displayName,
      email: _email,
    );
  }

  factory UserInfo.fromJson(Map<String, dynamic> map) {
    return UserInfo(
      id: map['id'] as int?,
      displayName: map['name'] as String?,
      email: map['email'] as String?,
    );
  }

  String toJson() => json.encode(toMap());
}
