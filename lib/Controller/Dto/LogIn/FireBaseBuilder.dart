import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sc/Screens/Board/MainBoard.dart';
//import 'package:flutter_sc/Screens/Login/homeScreen.dart';

import 'package:flutter_sc/Screens/Login/loginScreen.dart';

class FireBaseAuth extends StatelessWidget {
  const FireBaseAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> user) {
          if (!user.hasData) {
            return const LoginScreen();
          } else {
            return const MainBoardScreen();
          }
        });
  }
}
