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
      appBar: AppBarBase(title: 'editMyPost'),
      bottomNavigationBar: TabBarBase(),
      body: ListView(
        children: [
          Column(
            children: [
              Container(child: Text('A')),
              Container(child: Text('B')),
              Container(child: Text('C'))
            ],
          )
        ],
      ),
    );
  }
}
