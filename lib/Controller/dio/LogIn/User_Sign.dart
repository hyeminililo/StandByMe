import 'dart:convert';

import 'package:flutter_sc/Model/Data/UserInfo.dart';
import 'package:http/http.dart' as http;

// 서버엫서 로그인 정보를 가져오는 함수
Future<UserInfo> fetchUser(String token) async {
  const url = 'http://localhost:8091/user/user';
  final response = await http
      .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});
  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    UserInfo member = UserInfo.fromJson(json);
    return member;
  } else {
    throw Exception('Failed to fetch memer');
  }
}
