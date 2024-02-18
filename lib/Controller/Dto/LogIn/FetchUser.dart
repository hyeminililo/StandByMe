import 'dart:convert';

import 'package:flutter_sc/Controller/Dto/LogIn/GoogleAuth.dart';
import 'package:flutter_sc/Model/Provider/UserInfoProvider.dart';
import 'package:flutter_sc/Model/Data/Url.dart';
import 'package:flutter_sc/Model/Data/UserInfo.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// 서버서 로그인 정보를 가져오는 함수
Future<UserInfo> fetchUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  GoogleAuth googleAuth = GoogleAuth();
  String token =
      //  'eyJhbGciOiJSUzI1NiIsImtpZCI6ImFlYzU4NjcwNGNhOTZiZDcwMzZiMmYwZDI4MGY5NDlmM2E5NzZkMzgiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoi64Ko6raB7Zic66-8IiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FDZzhvY0xNaHAzUXh1SHc2Y1FjX19MUFNETkczVEdrS0NxS19vazZTWU5aOTVvdTh3PXM5Ni1jIiwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL3N0YW5kYnltZS01ZDg1NiIsImF1ZCI6InN0YW5kYnltZS01ZDg1NiIsImF1dGhfdGltZSI6MTcwODI1NjM2NiwidXNlcl9pZCI6IkozUkhSTUNhQXFRVU11aUdwTUlEUDRESHhXNDIiLCJzdWIiOiJKM1JIUk1DYUFxUVVNdWlHcE1JRFA0REh4VzQyIiwiaWF0IjoxNzA4MjU2MzY2LCJleHAiOjE3MDgyNTk5NjYsImVtYWlsIjoibmcwNDAxMTVAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMTUwNjE4MjM4Nzg4ODAyMzc4MDYiXSwiZW1haWwiOlsibmcwNDAxMTVAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoiZ29vZ2xlLmNvbSJ9fQ.FXCThmZq4t9QkVa3nVyuaDw4aym3J4akdv6fpcRxEp_Ynv15nuxKTi8q7ERgzcA1BPsa7zV0_RjtyNY-S-b92WqHzRmYOWzmNV55ToFmaaV73z4xSpDdb4JiK_doan5voJmlekZDqhD7evqdWnkIA7PXTl2WxD-SVQ1BWTOgVcGozBUzEixFUCp4RfVYUZUvRx3SkJqHMKw2L6kJXuwNTCcw_BiQJ_cWqnblfp8jD-NZ7-7cNc35hWkTVGNvRiNtKqEElteO477q0yXDnThrtb1lnaEV6SiSfwFf4czyrvv2XnE5Q9xAAk3dHt19S2yG5heqXvJuc32pjKZMqjob7Q';
      prefs.getString('accessToken') ?? '';
  //'eyJhbGciOiJSUzI1NiIsImtpZCI6ImFlYzU4NjcwNGNhOTZiZDcwMzZiMmYwZDI4MGY5NDlmM2E5NzZkMzgiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoi64Ko6raB7Zic66-8IiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FDZzhvY0xNaHAzUXh1SHc2Y1FjX19MUFNETkczVEdrS0NxS19vazZTWU5aOTVvdTh3PXM5Ni1jIiwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL3N0YW5kYnltZS01ZDg1NiIsImF1ZCI6InN0YW5kYnltZS01ZDg1NiIsImF1dGhfdGltZSI6MTcwODE2OTgyMCwidXNlcl9pZCI6IkozUkhSTUNhQXFRVU11aUdwTUlEUDRESHhXNDIiLCJzdWIiOiJKM1JIUk1DYUFxUVVNdWlHcE1JRFA0REh4VzQyIiwiaWF0IjoxNzA4MTY5ODIwLCJleHAiOjE3MDgxNzM0MjAsImVtYWlsIjoibmcwNDAxMTVAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMTUwNjE4MjM4Nzg4ODAyMzc4MDYiXSwiZW1haWwiOlsibmcwNDAxMTVAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoiZ29vZ2xlLmNvbSJ9fQ.Eerd9_SCiSiNLdVcTro3BC4kFzwmCI759GPCPx-7rXR51aVpMZvIpQcI0KI6w8DrCQsSywsux_b8xZNpkeiHrutdpEsiQZUYjpRPhNoMm4z2BkGun0UtHYT4yn2oyiHH2PwnnvaEC1orCAf8NkT5tXdUg4uvpWKMgoFJWFuVuW_5sv_56QauLiiKvx43ZK-v9HOCIk3Rw8oxJQ0dBS4tKcXLerajTH991yMeXJzqF-fKkOnx74hnh1V8VaHltxyeNe8mwXR9q5QTkQJY4khLD900WXuhSZ0lEQVp6KtnaqUpGdcq4tirWazlPYrVtIiGC5ZPT7BVXTccPR-2wkgk0Q'; //prefs.getString('accessToken') ?? '';

  print('token: $token');

  final dynamic response = await http.get(Uri.parse(USER_INFO_URL), headers: {
    'accept': 'application/json;charset=UTF-8',
    'Authorization': 'Bearer $token'
  });
  print(response.statusCode);
  if (response.statusCode == 200 || response.statusCode == 201) {
    Map<String, dynamic> json = jsonDecode(response.body);
    UserInfo member = UserInfo.fromJson(json);
    print('회원 정보 받아오기 성공');
    UserInfoProvider userInfoProvider = UserInfoProvider();
    userInfoProvider.userInfo = member;
    print('member: $member');
    print('id: ${member.id}');
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
