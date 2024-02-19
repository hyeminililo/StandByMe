import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sc/Controller/Dto/LogIn/GoogleAuth.dart';
import 'package:flutter_sc/Model/Data/UserInfo/UserInfoList.dart';
import 'package:flutter_sc/Model/Provider/UserInfoProvider.dart';
import 'package:flutter_sc/Model/Data/Url.dart';
import 'package:flutter_sc/Model/Data/UserInfo/UserInfoDB.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserDto extends ChangeNotifier {
  UserInfoDB userInfo = UserInfoDB();
  Future<http.Response> saveUser(String id, String email, String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token =
        'eyJhbGciOiJSUzI1NiIsImtpZCI6ImFlYzU4NjcwNGNhOTZiZDcwMzZiMmYwZDI4MGY5NDlmM2E5NzZkMzgiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoi64Ko6raB7Zic66-8IiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FDZzhvY0xNaHAzUXh1SHc2Y1FjX19MUFNETkczVEdrS0NxS19vazZTWU5aOTVvdTh3PXM5Ni1jIiwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL3N0YW5kYnltZS01ZDg1NiIsImF1ZCI6InN0YW5kYnltZS01ZDg1NiIsImF1dGhfdGltZSI6MTcwODI3NjgxOSwidXNlcl9pZCI6IkozUkhSTUNhQXFRVU11aUdwTUlEUDRESHhXNDIiLCJzdWIiOiJKM1JIUk1DYUFxUVVNdWlHcE1JRFA0REh4VzQyIiwiaWF0IjoxNzA4Mjc2ODE5LCJleHAiOjE3MDgyODA0MTksImVtYWlsIjoibmcwNDAxMTVAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMTUwNjE4MjM4Nzg4ODAyMzc4MDYiXSwiZW1haWwiOlsibmcwNDAxMTVAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoiZ29vZ2xlLmNvbSJ9fQ.Lr0ylIZGJEpQcGwekge7yCktEWbWFzCuF2LbTpsF0IBujKA4UCngGFY9PMoHJJJsLH6hrpvstwiBrA2N3nPYbLFyhHt4VPmATJS2wq0ntjbKM9txNQdDKgtu5VB2RLh-c6vdLpYmxXIjQSnqVsp02TjY03UT-qPPcbZ6qfnryxFkvTcIxz1gnQAJ6uRj350-60Wd228_Diro7G1p8aAmFshJ1EcAV6jsktb3a4BBQ1PymdVTkPAgW4bjQ71RHSz48YXRW4mV3mYy1oVYTJWjTLrbPl056G7O1WpYw2Y3NY4-iFCe0YOrDaYNOfOlpIR95k1ziIFx6CvjQzHrT0V3xQ';
    //  'eyJhbGciOiJSUzI1NiIsImtpZCI6ImFlYzU4NjcwNGNhOTZiZDcwMzZiMmYwZDI4MGY5NDlmM2E5NzZkMzgiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoi64Ko6raB7Zic66-8IiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FDZzhvY0xNaHAzUXh1SHc2Y1FjX19MUFNETkczVEdrS0NxS19vazZTWU5aOTVvdTh3PXM5Ni1jIiwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL3N0YW5kYnltZS01ZDg1NiIsImF1ZCI6InN0YW5kYnltZS01ZDg1NiIsImF1dGhfdGltZSI6MTcwODI1NjM2NiwidXNlcl9pZCI6IkozUkhSTUNhQXFRVU11aUdwTUlEUDRESHhXNDIiLCJzdWIiOiJKM1JIUk1DYUFxUVVNdWlHcE1JRFA0REh4VzQyIiwiaWF0IjoxNzA4MjU2MzY2LCJleHAiOjE3MDgyNTk5NjYsImVtYWlsIjoibmcwNDAxMTVAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMTUwNjE4MjM4Nzg4ODAyMzc4MDYiXSwiZW1haWwiOlsibmcwNDAxMTVAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoiZ29vZ2xlLmNvbSJ9fQ.FXCThmZq4t9QkVa3nVyuaDw4aym3J4akdv6fpcRxEp_Ynv15nuxKTi8q7ERgzcA1BPsa7zV0_RjtyNY-S-b92WqHzRmYOWzmNV55ToFmaaV73z4xSpDdb4JiK_doan5voJmlekZDqhD7evqdWnkIA7PXTl2WxD-SVQ1BWTOgVcGozBUzEixFUCp4RfVYUZUvRx3SkJqHMKw2L6kJXuwNTCcw_BiQJ_cWqnblfp8jD-NZ7-7cNc35hWkTVGNvRiNtKqEElteO477q0yXDnThrtb1lnaEV6SiSfwFf4czyrvv2XnE5Q9xAAk3dHt19S2yG5heqXvJuc32pjKZMqjob7Q';
    //   prefs.getString('accessToken') ?? '';
    // 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImFlYzU4NjcwNGNhOTZiZDcwMzZiMmYwZDI4MGY5NDlmM2E5NzZkMzgiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoi64Ko6raB7Zic66-8IiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FDZzhvY0xNaHAzUXh1SHc2Y1FjX19MUFNETkczVEdrS0NxS19vazZTWU5aOTVvdTh3PXM5Ni1jIiwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL3N0YW5kYnltZS01ZDg1NiIsImF1ZCI6InN0YW5kYnltZS01ZDg1NiIsImF1dGhfdGltZSI6MTcwODI3NTkwNiwidXNlcl9pZCI6IkozUkhSTUNhQXFRVU11aUdwTUlEUDRESHhXNDIiLCJzdWIiOiJKM1JIUk1DYUFxUVVNdWlHcE1JRFA0REh4VzQyIiwiaWF0IjoxNzA4Mjc1OTA2LCJleHAiOjE3MDgyNzk1MDYsImVtYWlsIjoibmcwNDAxMTVAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMTUwNjE4MjM4Nzg4ODAyMzc4MDYiXSwiZW1haWwiOlsibmcwNDAxMTVAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoiZ29vZ2xlLmNvbSJ9fQ.Lly8fpnajalzP7YlBNZIVb5NDNK9BRuY8SsBZbHeKS1513IQi79hcU12kmVWgoogwD_sNWyGYu0_QRSLrxzzShhl00U_8nV5jVVOefOe_WE_hXAgFcPJODaNOja4ZohhqhucPaYcJYF771HELFOWlXCuTX7IIHUks9jRJl78bsJui3eLSj8FNlePTWK0QI6g8iN5sCwwOKtm3rZNIb4TH_k_v5ZvxpDdbkbTeZ_lb7HRzrHl_kwuTHTSQOX7kRw-ZCIRUO1RJ67e9aXJ_OgpQ-KPFO8fECVVzqo8vriIpLt-1yedbAfdNKbPv19meZ0oPY2vKNEBc92JbDJiGcn0Jw';
    Map<String, String> headers = {
      "accept": "application/json;charset=UTF-8",
      "Authorization": 'Bearer $token'
    };
    Map data = {
      'id': userInfo.id,
      'email': userInfo.email,
      'name': userInfo.displayName
    };
    var body = json.encode(data);
    var response = await http.post(Uri.parse(AUTH_CREATE_URL),
        headers: headers, body: body);
    print(response.statusCode);
    print(response.body);
    return response;
  }

// 서버서 로그인 정보를 가져오는 함수
  Future<UserInfoDB> fetchUser() async {
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
    print('fetchUser ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> json = jsonDecode(response.body);
      UserInfoDB member = UserInfoDB.fromJson(json);
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

  Future<void> getLoginList() async {
    // final routeFromJsonFile =
    //     await rootBundle.loadString('assets/json/g_user_details.json');
    // final userinfoDBList =
    //     UserInfoDBList.fromJson(routeFromJsonFile).userinfoDbs ??
    //         <UserInfoDB>[];
    // print("====== userInfoDBList ${userinfoDBList[0]}");

    final routeFromJsonFile =
        await rootBundle.loadString('assets/json/g_user_detail.json');
    Map<String, dynamic> userInfoMap = json.decode(routeFromJsonFile);

    final userinfoDB = UserInfoDB.fromJson(userInfoMap);

    userinfoDB.id = userinfoDB.id;
    userinfoDB.displayName = userinfoDB.displayName;
    userinfoDB.email = userinfoDB.email;

    print("====== userInfoDBList ${userinfoDB.id}");

    notifyListeners();
  }
}
