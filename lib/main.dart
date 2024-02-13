import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sc/Controller/Dto/FireBase/firebase_options.dart';
import 'package:flutter_sc/Model/Provider/UserInfoProvider.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sc/Model/Provider/BoardProvider.dart';

import 'Controller/Router/goRouter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserInfoProvider()),
      ChangeNotifierProvider(create: (_) => BoardProvider())
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
      theme: ThemeData(useMaterial3: true, primaryColor: PRIMARYCOLOR),
    );
  }
}
