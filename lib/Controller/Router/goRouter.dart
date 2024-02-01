import 'package:flutter_sc/Screens/Board/MainBoard.dart';
import 'package:flutter_sc/Screens/Board/createPostScreen.dart';
import 'package:flutter_sc/Screens/Login/joinScreen.dart';
import 'package:flutter_sc/Screens/Login/loginSuccessScreen.dart';
import 'package:flutter_sc/Screens/Login/loginScreen.dart';
import 'package:flutter_sc/Screens/Setting/settingMainScreen.dart';
import 'package:go_router/go_router.dart';

import '../../Screens/Setting/editMyPostScreen.dart';
import '../../Screens/Setting/profileScreen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const LoginScreen(), routes: [
    GoRoute(
      path: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: 'loginSucess',
      builder: (context, state) => const LoginSuccessScreen(),
    ),
    GoRoute(
      path: 'join',
      builder: (context, state) => const JoinScreen(),
    ),
    //Setting0
    GoRoute(
      path: 'settingMain',
      builder: (context, state) => const SettingMainScreen(),
    ),
    GoRoute(
      path: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: 'editMyPost',
      builder: (context, state) => const EditMyPostScreen(),
    ),
    GoRoute(
      path: 'creatPost',
      builder: (context, state) => const CreatPostScreen(),
    ),
    GoRoute(
      path: 'mainBoard',
      builder: (context, state) => const MainBoardScreen(),
    ),
  ]),
]);
