import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/widget/TabBar.dart';
import 'package:flutter_sc/Model/common/widget/appBar.dart';

class boardScreen extends StatefulWidget {
  const boardScreen({super.key});

  @override
  State<boardScreen> createState() => _boardScreenState();
}

class _boardScreenState extends State<boardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarBase(title: 'boardScreen'),
      body: Column(
        children: [
          Row(
            children: [
              Text('제목'), //Text('$titleLarge')
            ],
          ),
          Row(
            children: [
              Text('좋아요'),
              //  Text('$likely'),
              Text('저장 수'),
              // Text('$comment')
            ],
          ),
          Row(
              //     children: [Text('사진'), Text('$picture')],
              ),
        ],
      ),
      bottomNavigationBar: TabBarBase(),
    );
  }
}
