import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
                  '${userInfoProvider.userInfo!.displayName}',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
            padding,
            Row(children: [
              const Text(
                'E-mail :',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                ' ${userInfoProvider.userInfo!.email}',
                style: const TextStyle(fontSize: 20),
              )
            ]),
            const SizedBox(
              height: 30,
            ),
          ]),
        ));
  }
}
