import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sc/Controller/Dto/LogIn/UserDto.dart';
import 'package:flutter_sc/Model/Data/UserInfo/UserInfoDB.dart';
import 'package:flutter_sc/Model/Provider/UserInfoProvider.dart';
import 'package:flutter_sc/Model/common/color.dart';

import '../../Model/common/widget/TabBar.dart';
import '../../Model/common/widget/appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserInfoProvider userInfoProvider = UserInfoProvider();
  UserDto userDto = UserDto();
  UserInfoDB userInfoDB = UserInfoDB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarBase(title: 'profile'),
        bottomNavigationBar: const TabBarBase(),
        body: Center(
          child: Column(children: [
            Column(
              children: [
                const Icon(
                  Icons.person_2_rounded,
                  size: 150,
                ),
                padding,
                Text(
                  '${userInfoDB.displayName}',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
            padding,
            Center(
              child: Row(children: [
                Text(
                  '      - E-mail :${userInfoDB.email}',
                  style: const TextStyle(fontSize: 25),
                ),
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
          ]),
        ));
  }
}
