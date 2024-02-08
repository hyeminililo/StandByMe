import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_sc/Controller/dio/FireBase/googleAuth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  //final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 로그인 화면
  //final Auth authService = Auth();
  Dio dio = Dio();
  final _formKey = GlobalKey<FormState>();

  GoogleAuth googleAuth = GoogleAuth();
  final String _id = '';

  final String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARYCOLOR,
        body: SingleChildScrollView(
            child: Center(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.all(65)),
                        SizedBox(
                          width: 200,
                          child: Image.asset('assets/logo.png'),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        const Text(
                          'Stand By Me',
                          style:
                              TextStyle(fontSize: 45, color: MAIN_TEXT_COLOR),
                        ),
                        const Text(
                          'Foreign community',
                          style:
                              TextStyle(fontSize: 25, color: MAIN_TEXT_COLOR),
                        ),
                        padding,
                        Column(
                          children: [
                            // createWith를 누르면 goRouter로 구글 로그인으로 바로 이동하게 구현하기 (구글로그인으로 이동한 후에 joindㅡ로 닉네임 값만  받기 )
                            TextButton(
                                onPressed: () => context.go('/join'),
                                child: const Text(
                                  'Create with',
                                  style: TextStyle(color: MAIN_TEXT_COLOR),
                                )),
                            TextButton(
                              onPressed: () async {
                                await googleAuth
                                    .signInWithGoogle(); // 회원가입여부 확인해서

                                // final String? userId =
                                //     FirebaseAuth.instance.currentUser?.uid;
                                // dio.get(
                                //     'http://localhost:8091/user/user$userId');
                                // //dio.post로 이메일을 여기서 날림
                                //        UserInfo
                              },
                              child: const Text("Google Log In",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  )),
                            ),
                            IconButton(
                                onPressed: () {
                                  googleAuth.signInWithGoogle();
                                },
                                icon: Image.asset("assets/google.png",
                                    width: 40, height: 30
                                    //  child:linkWell(borderRad),
                                    )),
                            TextButton(
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                },
                                child: const Text(' 로그아웃')),
//로그아웃 일단 구현이 안 됨
                          ],
                        ),
                      ],
                    )))));
  }
}
