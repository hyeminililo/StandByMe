import 'dart:convert';

import 'package:flutter_sc/Model/Data/User.dart';
import 'package:http/http.dart' as http;

// 서버엫서 로그인 정보를 가져오는 함수
Future<Member> fetchUser() async {
  final response = await http.get(Uri.parse('http://localhost:8091/user/user'));

  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    Member member = Member.fromJson(json);
    return member;
  } else {
    throw Exception('Failed to fetch memer');
  }
}
