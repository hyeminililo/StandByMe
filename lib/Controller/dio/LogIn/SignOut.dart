import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;

enum LoginPlatform {
  google,
  none, // logout
}

LoginPlatform _loginPlatform = LoginPlatform.none;

Future<void> signOut() async {
  switch (_loginPlatform) {
    case LoginPlatform.google:
      await GoogleSignIn().signOut();
      break;
    case LoginPlatform.none:
      break;
  }
  /*setState(() {
    _loginPlatform = LoginPlatform.none;
  });*/
}

void googleSignOut() async {
  // await _auth.singOi
}
