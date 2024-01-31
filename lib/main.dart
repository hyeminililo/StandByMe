import 'package:flutter/material.dart';
import 'package:flutter_sc/Controller/dio/firebase_options.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'Controller/Router/goRouter.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, 
      title: 'Log In',
      theme: ThemeData(useMaterial3: true, primaryColor: PRIMARYCOLOR),
    );
  }
}
