import 'package:flutter/material.dart';
import 'package:flutter_sc/Controller/Dto/Board/DioBoard.dart';
import 'package:flutter_sc/Model/Data/Board/BoardCreateDB.dart';
import 'package:flutter_sc/Model/Data/Board/Board_List.dart';
import 'package:flutter_sc/Model/common/widget/appBar.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:motion_tab_bar_v2/motion-tab-item.dart';

import '../../Model/common/widget/TabBar.dart';

class MainBoardScreen extends StatefulWidget {
  const MainBoardScreen({super.key});

  @override
  State<MainBoardScreen> createState() => _MainBoardScreenState();
}

class _MainBoardScreenState extends State<MainBoardScreen> {
  late Future<List<dynamic>> boardDetailsDb;
  final BoardCreateDB boardCreateDB = BoardCreateDB();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    boardDetailsDb = boardCreateDB.fetchPosts();
    //   boardDetailsDb = boardCreateDB.getBoardList();

    //boardDetailsDb = boardCreateDB.getBoardList() as Future<List<dynamic>>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBase(title: 'Board'),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1),()=> boardList),
        // <List<dynamic>>
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<dynamic> posts = snapshot.data!;
            print("===== data? ${snapshot.data}");
            return ListView.separated(
              itemBuilder: (context, index) {
                if (posts[index] != null) {
                  return ListTile(
                    title: Text('Title: ${posts[index]["title"]}',
                        style: const TextStyle(fontSize: 20)),

                    subtitle: Text(
                      "Contents: ${posts[index]["contents"]}",
                    ),
                  );
                } else {
                  return const ListTile(
                    title: Text("error"),
                    subtitle: Text("error"),
                  );
                }
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: posts.length,
            );
          } else if (snapshot.hasError) {
            print("------ snapshot data error ");
            return const Text("error!");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),/*,FutureBuilder(
      future: boardDetailsDb,
      // <List<dynamic>>
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<dynamic> posts = snapshot.data!;
          print("===== data? ${snapshot.data}");
          return ListView.separated(
            itemBuilder: (context, index) {
              if (posts[index] != null) {
                return ListTile(
                  title: Text('title: ${posts[index]["title"]}',
                      style: const TextStyle(fontSize: 25)),
                  subtitle: Text(
                    "Id: ${posts[index]["id"]}",
                  ),
                );
              } else {
                return const ListTile(
                  title: Text("error"),
                  subtitle: Text("error"),
                );
              }
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: posts.length,
          );
        } else if (snapshot.hasError) {
          print("------ snapshot data error ");
          return const Text("error");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/creatPost');
        },
        child: const Icon(Icons.screenshot_rounded),
      ),
      bottomNavigationBar: const TabBarBase(),
    );
  }
}
