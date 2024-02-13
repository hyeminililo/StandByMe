import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sc/Controller/Dto/LogIn/FetchUser.dart';
import 'package:flutter_sc/Model/Provider/UserInfoProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_sc/Model/Data/UserInfo.dart' as flutterUserInfo;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class GoogleAuth {
  // handleSign 메소드 : 구글 로그인 처리하고, 인증된 사용자 정보 가져와 firebase 인증 수행
  //provider를 통해 인스턴스에 사용자 정보 설정
  // 로그인 성공시 userCredential 반환 -> fetechUser를 반환하는게 맞는듯? 안에 토큰 값 넣어서 !
  Future<flutterUserInfo.UserInfo> handleSignIn(BuildContext context) async {
    // 구글 로그인 관리할 클래스
    final GoogleSignIn googleSignIn =
        GoogleSignIn(scopes: ['email', 'profile']);
    //   UserInfo userInfo = UserInfo.fromJson(context);

    try {
      // 구글 로그인에 성공한 사용자의 계정 정보를 나타내는 클래스
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        // 구글 로그인 인증 정보를 나타내는 클래스
        final GoogleSignInAuthentication googleSignInAuth =
            await googleSignIn.currentUser!.authentication;
        //  await account.authentication;
        // 구글 인증에 필요한 액세스 토큰과 ID 토큰 생성
        final AuthCredential googleCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuth.accessToken,
            idToken: googleSignInAuth.idToken);

        // Create a new credential으로 accessToken과 idToken 을 저장 (credential에)
//       final AuthCredential googleCredential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
        final firebaseAuth = FirebaseAuth.instance;
        print(googleCredential.accessToken);
        print('dddd');
        print(googleSignInAuth.accessToken);
        // firebase 에 대한 인증을 수행하고 성공적으로 인증되면 userCredential 반환 => 이 부분을 바꿔야 할듯?
        flutterUserInfo.UserInfo userInfo =
            await fetchUser(googleSignInAuth.accessToken!);

        // Provider를 이용해 인스턴스에 인증된 사용자 정보 설정

        //     Provider.of<UserInfoProvider>(context, listen: false).userInfo =    userInfo;
        Provider.of<UserInfoProvider>(context, listen: false).userInfo =
            userInfo;

        GoRouter.of(context).go('/mainBoard');
        return userInfo;
      }
      throw Exception("Google Sign-in failed");
      // final GoogleSignInAuthentication googleAuth =
      //     await _googleSignIn.currentUser!.authentication;
      //   final String token = googleAuth.idToken!;
      // User user = await fetchUser(token);
    } catch (E) {
      print('여기가 오류야...');

      throw Exception(E);
    }
  }
}
