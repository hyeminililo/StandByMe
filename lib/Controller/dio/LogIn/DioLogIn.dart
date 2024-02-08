import 'package:dio/dio.dart';
import 'package:flutter_sc/Model/Data/TokenKey.dart';
import 'package:flutter/material.dart';

class DioLogin with ChangeNotifier {
  bool isLoggedIn = false;
  final Dio _dio;

  String? acessToken;
  String? refreshToken;

  DioLogin() : _dio = Dio();

  void login() {
    isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    isLoggedIn = false;
    notifyListeners();
  }

  Future<void> refreshAccessToken() async {
    final response = await _dio
        .post('http://$ip/auth/regfresh', data: {'refreshToken': refreshToken});
    final data = response.data;
    acessToken = data['accessToken'];
  }
}
