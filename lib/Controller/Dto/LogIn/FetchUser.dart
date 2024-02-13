import 'dart:convert';

import 'package:flutter_sc/Model/Provider/UserInfoProvider.dart';
import 'package:flutter_sc/Model/Data/Url.dart';
import 'package:flutter_sc/Model/Data/UserInfo.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// 서버서 로그인 정보를 가져오는 함수
Future<UserInfo> fetchUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String token = prefs.getString('accessToken') ?? '';

  print('token: $token');

  final dynamic response = await http.get(Uri.parse(USER_INFO_URL),
      headers: {'Authorization': 'Bearer $token'});
  print(response.statusCode);
  if (response.statusCode == 200 || response.statusCode == 201) {
    Map<String, dynamic> json = jsonDecode(response.body);
    UserInfo member = UserInfo.fromJson(json);
    print('회원 정보 받아오기 성공');
    UserInfoProvider userInfoProvider = UserInfoProvider();
    userInfoProvider.userInfo = member;

    return member;
  } else {
    throw Exception('Failed to fetch member, 회원 정보 받아오기 실패 ');
  }
}

Future<bool> loginCheck(String token) async {
  final responseCheck = await http.get(Uri.parse(USER_INFO_URL),
      headers: {'Authorization': 'Bearer $token'});
  if (responseCheck.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
