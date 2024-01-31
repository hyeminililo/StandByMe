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
      body: Column(
        children: [
          Row(
            children: [
              const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
              const Text(
                'Free Board',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 180),
              TextButton(
                  onPressed: () => context.go('/creatPost'),
                  child: const Text('+ Creat Post'))
            ],
          ),
        ],
      ),
      bottomNavigationBar: const TabBarBase(),
    );
  }
}
