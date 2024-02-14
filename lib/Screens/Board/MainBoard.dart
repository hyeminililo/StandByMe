import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'package:flutter_sc/Model/common/widget/appBar.dart';
import 'package:go_router/go_router.dart';

import '../../Model/common/widget/TabBar.dart';

class MainBoardScreen extends StatefulWidget {
  const MainBoardScreen({super.key});

  @override
  State<MainBoardScreen> createState() => _MainBoardScreenState();
}

class _MainBoardScreenState extends State<MainBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBase(title: 'Board'),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return const ListTile(
              title: Text(items[index].title),
              onTap: () {},
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: items.length),
      bottomNavigationBar: const TabBarBase(),
    );
  }
}
