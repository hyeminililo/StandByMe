// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

class UserInfoDB extends ChangeNotifier {
  int? _id; //userid인건지 ,,
  String? _displayName;
  String? _email;

  UserInfoDB({
    int? id,
    String? displayName,
    String? email,
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

  UserInfoDB toMap() {
    return UserInfoDB(
      id: _id,
      displayName: _displayName,
      email: _email,
    );
  }

  factory UserInfoDB.fromJson(Map<String, dynamic> map) {
    return UserInfoDB(
      id: map['id'] as int?,
      displayName: map['name'] as String?,
      email: map['email'] as String?,
    );
  }

  String toJson() => json.encode(toMap());
}
