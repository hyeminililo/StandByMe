import 'package:flutter_sc/Screens/Login/joinScreen.dart';
import 'package:flutter_sc/Controller/dio/LogIn/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Controller/dio/FireBase/googleAuth.dart';

class Member1 {
  String? dropDownValueCountry;
  String? dropDownValueGender;

  // User? user = FirebaseAuth.instance.currentUser;
  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  // 계정에 적혀져있는 이름 Ex) thfcof4564
  final String? userEmail = FirebaseAuth.instance.currentUser?.email;
  String? userDisplayName = FirebaseAuth.instance.currentUser?.displayName;

  // 원래 사람 이름으로

  Member1(
      {required this.dropDownValueCountry, required this.dropDownValueGender});

//UserInfo(this.userId = user.uid, this.userGender, this.userCountry, this.userEmail,
//   this.userDisplayName);
//FireBaseAuth dhk = FireBaseAuth();
}


