import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sc/Controller/Provider/UserInfoProvider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_sc/Model/Data/UserInfo.dart' as flutterUserInfo;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class GoogleAuth {
  Future<UserCredential> handleSignIn(BuildContext context) async {
    final GoogleSignIn googleSignIn =
        GoogleSignIn(scopes: ['email', 'profile']);
    //   UserInfo userInfo = UserInfo.fromJson(context);

    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final GoogleSignInAuthentication googleSignInAuth =
            await googleSignIn.currentUser!.authentication;
        //  await account.authentication;
        final AuthCredential googleCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuth.accessToken,
            idToken: googleSignInAuth.idToken);
        final firebaseAuth = FirebaseAuth.instance;
        UserCredential userCredential =
            await firebaseAuth.signInWithCredential(googleCredential);
        flutterUserInfo.UserInfo userInfo = flutterUserInfo.UserInfo(
            id: int.parse(userCredential.user!.uid),
            displayname: userCredential.user!.displayName!,
            email: userCredential.user!.email!);
        Provider.of<UserInfoProvider>(context, listen: false).userInfo =
            userInfo;
        return userCredential;
      }
      throw Exception("Google Sign-in failed");
      // final GoogleSignInAuthentication googleAuth =
      //     await _googleSignIn.currentUser!.authentication;
      //   final String token = googleAuth.idToken!;
      // User user = await fetchUser(token);
    } catch (E) {
      print(E);
      print('여기가 오류야...');
      throw UnsupportedError('This function is not supported.');
    }
  }
}
