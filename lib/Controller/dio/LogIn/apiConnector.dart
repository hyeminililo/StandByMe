import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiConnector {
  final Dio _dio;

  ApiConnector(this._dio);

// User 정보 얻는 함수..? -> 오류 제거를 위해 일단 void로 바꿈
  Future<void> getUser() async {
    try {
      return _dio.get("http://localhost:8091/member").then((response) {
        print(response.statusCode);
        List<UserInfo> users = [];
        for (var data in response.data) {
       //   final user = User.fromJson(data);
        //    user.add(user);
          }
         // return UserInfo;
        });
      } catch(e){
        print(e);
        throw Exception();
      }
    }
}