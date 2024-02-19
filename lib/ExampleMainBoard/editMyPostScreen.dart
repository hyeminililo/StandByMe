import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/widget/TabBar.dart';
import 'package:flutter_sc/Model/common/widget/appbar.dart';

class ExampleEditMyPostScreen extends StatefulWidget {
  const ExampleEditMyPostScreen({super.key});

  @override
  State<ExampleEditMyPostScreen> createState() =>
      _ExampleEditMyPostScreenState();
}

class _ExampleEditMyPostScreenState extends State<ExampleEditMyPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBase(title: 'editMyPost'),
      bottomNavigationBar: const TabBarBase(),
      body: ListView(
        children: [
          Column(
            children: [
              Container(child: const Text('A')),
              Container(child: const Text('B')),
              Container(child: const Text('C'))
            ],
          )
        ],
      ),
    );
  }
}
