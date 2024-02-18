import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sc/Controller/Dto/LogIn/FetchUser.dart';
import 'package:flutter_sc/Model/Data/TokenKey.dart';
import 'package:flutter_sc/Model/common/client.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_sc/Model/Data/UserInfo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuth {
  // handleSign 메소드 : 구글 로그인 처리하고, 인증된 사용자 정보 가져와 firebase 인증 수행
  //provider를 통해 인스턴스에 사용자 정보 설정
  // 로그인 성공시 userCredential 반환 -> fetechUser를 반환하는게 맞는듯? 안에 토큰 값 넣어서 !
  Future<dynamic> handleSignIn(BuildContext context) async {
    // 구글 로그인 관리할 클래스 clientId: GOOGLE_CLIENT_ID
    final GoogleSignIn googleSignIn = GoogleSignIn(clientId: GOOGLE_CLIENT_ID);
    final UserDto userDto = UserDto();
    //UserInfo userInfo = UserInfo.fromJson(googleSignIn.);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      // 구글 로그인에 성공한 사용자의 계정 정보를 나타내는 클래스
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      Map accountID = await account!.authHeaders;

      print('accountID: $accountID');

      // 구글 로그인 인증 정보를 나타내는 클래스
      final GoogleSignInAuthentication googleSignInAuth =
          await account.authentication;
      // await googleSignIn.currentUser!.authentication;

      // 구글 인증에 필요한 액세스 토큰과 ID 토큰 생성
      final AuthCredential googleCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuth.accessToken,
          idToken: googleSignInAuth.idToken);
      await prefs.setString('accessToken', googleCredential.accessToken!);
      final firebaseAuth = FirebaseAuth.instance;

      UserCredential user =
          await firebaseAuth.signInWithCredential(googleCredential);
//UserCredential users = await signInWithGoogle();
      print("user ----$user");

      firebaseAuth.authStateChanges().listen((User? user) {
        if (user == null) {
          print("user is currently signed out");
        } else {
          print('user is signed in!');
        }
      });
      print(googleSignInAuth.accessToken);

      UserInfoDB userInfo = await userDto.fetchUser();
// GoRouter.of(context).go('/mainBoard');
      return userInfo;
      //flutterUserInfo.UserInfo
      //throw Exception("Google Sign-in failed");
    } catch (E) {
      log(E.toString());

      print('여기가 오류야...');

      log(E.toString());
      //throw Exception(E);
    }
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn(clientId: GOOGLE_CLIENT_ID);
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   //UserCredential user = await signInWithGoogle();
  //   //print("user ----$user");

  //   print('Acess token : ${credential.accessToken}');
  //   print('id token: ${credential.idToken}');
  //   flutterUserInfo.UserInfo userInfo = await fetchUser();
  //   print(FirebaseAuth.instance.signInWithCredential(credential));
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
}
