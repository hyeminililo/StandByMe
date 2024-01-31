import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/widget/TabBar.dart';
import 'package:flutter_sc/Model/common/widget/appbar.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

//appBar를 따로 만들어서 상솏받게 하면 좋겟다 ,,,
class SettingMainScreen extends StatefulWidget {
  const SettingMainScreen({super.key});

  @override
  State<SettingMainScreen> createState() => _SettingMainScreenState();
}

class _SettingMainScreenState extends State<SettingMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBase(title: 'settingMain'),
      bottomNavigationBar: const TabBarBase(),
      body: ListView(
        children: [
          Column(
            children: [
              PrettySlideUnderlineButton(label: 'Profile', onPressed: ()=>context.go('/profile')),
              PrettySlideUnderlineButton(label: 'Edit My Post', onPressed: ()=>context.go('/editMyPost')),
              PrettySlideUnderlineButton(label: 'Log Out', onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}
//listview
