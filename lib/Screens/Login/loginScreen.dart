import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_sc/Controller/Dto/LogIn/GoogleAuth.dart';

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
  // final String _id = '';

//  final String _password = '';
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
                        padding,
                        padding,
                        Column(
                          children: [
                            // createWith를 누르면 goRouter로 구글 로그인으로 바로 이동하게 구현하기 (구글로그인으로 이동한 후에 joindㅡ로 닉네임 값만  받기 )

                            TextButton(
                              onPressed: () async {
                                await googleAuth.handleSignIn(context);
                                context.go('/mainBoard');
                              },
                              child: const Text("Google Log In",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                            ),
                            IconButton(
                                onPressed: () async =>
                                    await googleAuth.handleSignIn(context),
                                icon: Image.asset("assets/google.png",
                                    width: 60, height: 40
                                    //  child:linkWell(borderRad),
                                    )),
                            //delete
                          ],
                        ),
                      ],
                    )))));
  }
}
