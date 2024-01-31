import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/color.dart';

import '../../Model/common/widget/TabBar.dart';
import '../../Model/common/widget/appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarBase(title: 'profile'),
        bottomNavigationBar: const TabBarBase(),
        body: ListView(
          children: [
            Column(children: [
              Column(
                children: [
                  const Icon(
                    Icons.person_2_rounded,
                    size: 150,
                  ),
                  padding,
                  const Text(
                    '$defaultFirebaseAppName',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),padding,
              const Row(children: [
                Text(
                  'E-mail : ',
                  style: TextStyle(fontSize: 30),
                ), Text('emial')
              ]),
              const Row(children: [
                Text(
                  'Country : ',
                  style: TextStyle(fontSize: 30),
                ),
              ]),
              const Row(children: [
                Text(
                  'Gender:  ',
                  style: TextStyle(fontSize: 30),
                ),
              ]),
            ]),
          ],
        ));
  }
}
