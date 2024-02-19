import 'dart:convert';

import 'package:flutter_sc/Model/Data/Board/BoardCreateDB.dart';
import 'package:flutter_sc/Model/Data/Board/BoardModelDetails.dart';
import 'package:flutter_sc/Model/Data/UserInfo/UserInfoDB.dart';

class BoardCreatedDBList {
  final List<BoardcreteDB>? boardDbs;
  BoardCreatedDBList({this.boardDbs});

  factory BoardCreatedDBList.fromJson(String jsonString) {
    List<dynamic> listFromJson = json.decode(jsonString);
    List<BoardCreateDB> boardDbs = <BoardCreateDB>[];

    boardDbs =
        listFromJson.map((boardDb) => BoardCreateDB.fromJson(boardDb)).toList();
    return BoardCreatedDBList(boardDbs: boardDbs);
  }
}
