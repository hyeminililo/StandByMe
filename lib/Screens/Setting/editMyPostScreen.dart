import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/widget/TabBar.dart';
import 'package:flutter_sc/Model/common/widget/appbar.dart';

class EditMyPostScreen extends StatefulWidget {
  const EditMyPostScreen({super.key});

  @override
  State<EditMyPostScreen> createState() => _EditMyPostScreenState();
}

class _EditMyPostScreenState extends State<EditMyPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBase(title: 'editMyPost'),
      bottomNavigationBar: const TabBarBase(),
      body: ListView(
        children: const [
          Column(
            children: [Text('내 글 조회 : ')],
          )
        ],
      ),
    );
  }
}
