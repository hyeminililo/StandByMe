import 'package:flutter_sc/ExampleMainBoard/MainBoardModel.dart';
import 'package:flutter_sc/ExampleMainBoard/MainBoardSQflite.dart';

class MainBoardDao {
  final dbProvider = DatabaseProvider.provider;

  Future<int> createMainBoard(ExampleMainBoardModel mainBoard) async {
    final db = await dbProvider.database;
    final result = db.insert(mainBoardTable, mainBoard.toDatabaseJson());
    return result;
  }

  Future<List<ExampleMainBoardModel>> getMainBoardList() async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result = await db.query(mainBoardTable);
    List<ExampleMainBoardModel> mainboardList = result.isEmpty
        ? result
            .map((item) => ExampleMainBoardModel.fromDatabaseJson(item))
            .toList()
        : [];
    return mainboardList;
  }
}
