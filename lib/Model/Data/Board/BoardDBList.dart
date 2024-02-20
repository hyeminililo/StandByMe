import 'dart:convert';

import 'package:flutter_sc/Model/Data/Board/BoardCreateDB.dart';

class BoardDBList {
  final List<BoardCreateDB>? boardCreateDbs;
  BoardDBList({this.boardCreateDbs});

  factory BoardDBList.fromJson(String jsonString) {
    List<dynamic> listFromJson = json.decode(jsonString);
    List<BoardCreateDB> boardCreateDBs = <BoardCreateDB>[];

    boardCreateDBs = listFromJson
        .map((boardCreateDb) => BoardCreateDB.fromJson(boardCreateDb))
        .toList();
    return BoardDBList(boardCreateDbs: boardCreateDBs);
  }
}
