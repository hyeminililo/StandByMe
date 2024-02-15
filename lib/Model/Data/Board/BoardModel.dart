import 'dart:convert';

//listView에 띄우는 것
class BoardModel {
  late int? boardId;
  late String? contents;
  late String? title;
  late String? location;

  BoardModel(
      {this.boardId,
      required this.contents,
      required this.title,
      required this.location});

  Map<String, dynamic> toMap() {
    return {
      'id': boardId,
      'title': title,
      'contents': contents,
      'region': location,
    };
  }

  BoardModel.fromMap(Map<dynamic, dynamic>? map) {
    boardId = map?['boardId'];
    title = map?['title'];
    contents = map?['contents'];
    location = map?['region'];
  }
}
