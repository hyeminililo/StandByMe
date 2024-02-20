import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sc/firebase_options.dart';
import 'package:flutter_sc/Model/Provider/UserInfoProvider.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sc/Model/Provider/BoardProvider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

import 'Controller/Router/goRouter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAppCheck.instance.activate(
  //   // webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  //   // Set androidProvider to `AndroidProvider.debug`
  //   androidProvider: AndroidProvider.debug,
  // );

  // await FirebaseAuth.instance.useAuthEmulator('localhost', 8091);

  // FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //   if (user == null) {
  //     print('User is currently signed out!');
  //   } else {
  //     print('User  is signed in!');
  //   }
  // });
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserInfoProvider()),
      //  ChangeNotifierProvider(create: (_) => BoardProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //   final userInfoProvider = Provider.of<UserInfoProvider>(context);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Log In',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, primaryColor: PRIMARYCOLOR),
    );
  }
}
