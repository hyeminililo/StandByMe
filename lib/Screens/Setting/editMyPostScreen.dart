import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/Data/Board/BoardCreateDB.dart';
import 'package:flutter_sc/Model/common/widget/TabBar.dart';
import 'package:flutter_sc/Model/common/widget/appbar.dart';

class EditMyPostScreen extends StatefulWidget {
  const EditMyPostScreen({super.key});

  @override
  State<EditMyPostScreen> createState() => _EditMyPostScreenState();
}

class _EditMyPostScreenState extends State<EditMyPostScreen> {
  BoardCreateDB boardCreateDB = BoardCreateDB();
  @override
  Widget build(BuildContext context) {
    boardCreateDB.getBoardList();
    return Scaffold(
      appBar: const AppBarBase(title: 'editMyPost'),
      bottomNavigationBar: const TabBarBase(),
      body: ListView(
        children: [
          Column(
            children: [Text('내 글 조회 : ${boardCreateDB.contents}')],
          )
        ],
      ),
    );
  }
}
