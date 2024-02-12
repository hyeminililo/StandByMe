import 'dart:convert';

import 'package:flutter_sc/Controller/Provider/UserInfoProvider.dart';
import 'package:flutter_sc/Model/Data/UserInfo.dart';
import 'package:http/http.dart' as http;

const url = 'http://43.202.221.163:8091/user/details';

// 서버엫서 로그인 정보를 가져오는 함수
Future<UserInfo> fetchUser(String token) async {
  final response = await http
      .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});
  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    UserInfo member = UserInfo.fromJson(json);
    print('회원 정보 받아오기 성공');
    UserInfoProvider userInfoProvider = UserInfoProvider();
    userInfoProvider.userInfo = member;

    return member;
  } else {
    throw Exception('Failed to fetch memer, 회원 정보 받아오기 실패 ');
  }
}

Future<bool> loginCheck(String token) async {
  final responseCheck = await http
      .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});
  if (responseCheck.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
