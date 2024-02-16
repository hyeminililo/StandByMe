import 'package:flutter/material.dart';
import 'package:flutter_sc/Controller/Dto/Board/DioBoard.dart';
import 'package:flutter_sc/Model/Data/Board/MainBoardDB.dart';
import 'package:flutter_sc/Model/common/widget/appBar.dart';
import 'package:go_router/go_router.dart';

import '../../Model/common/widget/TabBar.dart';

class MainBoardScreen extends StatefulWidget {
  const MainBoardScreen({super.key});

  @override
  State<MainBoardScreen> createState() => _MainBoardScreenState();
}

class _MainBoardScreenState extends State<MainBoardScreen> {
  final BoardDetailsDB boardDetailsDB = BoardDetailsDB();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBase(title: 'Board'),
      body: FutureBuilder(
        future: boardDetailsDB.fetchPost(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<dynamic> posts = snapshot.data!;
            return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index]["title"]),
                  subtitle: Text("Id: ${posts[index]["id"]}"),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: posts.length,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/createBoard');
        },
        child: const Icon(Icons.screenshot_rounded),
      ),
      bottomNavigationBar: const TabBarBase(),
    );
  }
}
