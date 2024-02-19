import 'dart:convert';

import 'package:flutter_sc/Model/Data/UserInfo/UserInfoDB.dart';

class UserInfoDBList {
  final List<UserInfoDB>? userinfoDbs;
  UserInfoDBList({this.userinfoDbs});

  factory UserInfoDBList.fromJson(String jsonString) {
    List<dynamic> listFromJson = json.decode(jsonString);
    List<UserInfoDB> userinfoDbs = <UserInfoDB>[];

    userinfoDbs = listFromJson
        .map((userinfoDb) => UserInfoDB.fromJson(userinfoDb))
        .toList();
    return UserInfoDBList(userinfoDbs: userinfoDbs);
  }
}
