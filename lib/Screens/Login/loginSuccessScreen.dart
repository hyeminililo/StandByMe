import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'package:go_router/go_router.dart';

class LoginSuccessScreen extends StatefulWidget {
  const LoginSuccessScreen({super.key});

  @override
  State<LoginSuccessScreen> createState() => _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<LoginSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARYCOLOR,
        body: Center(
            child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(70)),
            const Icon(
              Icons.check_circle,
              color: MAIN_TEXT_COLOR,
              size: 150,
            ),
            const Padding(padding: EdgeInsets.all(50)),
            const Text(
              'Your account is set up',
              style: TextStyle(fontSize: 30, color: MAIN_TEXT_COLOR),
            ),
            const Padding(padding: EdgeInsets.all(50)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: MAIN_TEXT_COLOR,
                  shadowColor: SHADOW_TEXT_COLOR,
                  minimumSize: const Size(250, 50)),
              onPressed: () => context.go('/login'), //바로 홈으로
              child: const Text(
                'Log in',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        )));
  }
}
