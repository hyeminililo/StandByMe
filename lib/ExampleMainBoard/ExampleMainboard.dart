/*import 'package:flutter/material.dart';
import 'package:flutter_sc/ExampleMainBoard/MainBoardModel.dart';
import 'package:flutter_sc/ExampleMainBoard/mainBoardDAO.dart';
import 'package:flutter_sc/Model/common/widget/TabBar.dart';
import 'package:flutter_sc/Model/common/widget/appBar.dart';
import 'package:go_router/go_router.dart';

class ExampleboardScreen extends StatefulWidget {
  const ExampleboardScreen({Key? key}) : super(key: key);

  @override
  State<ExampleboardScreen> createState() => _ExampleboardScreenState();
}

class _ExampleboardScreenState extends State<ExampleboardScreen> {
  final MainBoardDao _mainBoardDao = MainBoardDao();
  final List<ExampleMainBoardModel> _mainboardList = [];
  Future<List<ExampleMainBoardModel>>? boardList;
  @override
  void initState() {
    super.initState();
    _loadMainBoardList();
  }

  void _addNewTodo(String title) async {
    ExampleMainBoardModel newBoard = ExampleMainBoardModel(
        id: null,
        title: title,
        contents: null,
        location: null,
        createdTime: DateTime.now());
    await _mainBoardDao.createMainBoard(newBoard);
    _loadMainBoardList();
  }

  void _loadMainBoardList() async {
    List<ExampleMainBoardModel> newList =
        await _mainBoardDao.getMainBoardList();
    setState(() {
      _mainboardList.clear();
      final mainboardList = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBase(title: 'boardScreen'),
      body: FutureBuilder(
        future: boardList,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.hasError}');
          } else if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (context, index) {
                ExampleMainBoardModel exampleMainBoardModel =
                    (snapshot.data as List<ExampleMainBoardModel>)[index];
                return ListTile(
                  title: Text(exampleMainBoardModel.title!),
                  subtitle: Text(exampleMainBoardModel.contents!),
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => )))
                    context.go('location');
                  },
                );
                /*ListTile(
                  title: Text(posts[index]["title"]),
                  subtitle: Text("Id: ${posts[index]["id"]}"),
                );*/
                GestureDetector(
                  onTap: () {},
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 8.0,
                  height: 8.0,
                  color: Colors.transparent,
                );
              },
              itemCount: (snapshot.data as List<ExampleMainBoardModel>).length,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed = () {
          context.go('/createPost');
        },
        child = const Icon(Icons.screenshot_rounded),
      ),
      bottomNavigationBar: const TabBarBase(),
    );
  }

  // Widget _createBoardPage() {
  //  context.go('/ExampleCreate');
  // }
}*/
