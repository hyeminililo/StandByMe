import 'dart:convert';

class BoardModel {
  int? _boardId;
  String? _contents;
  String? _title;
  String? _location;

  BoardModel({int? boardId, String? title, String? contents, String? location})
      : _boardId = boardId,
        _title = title,
        _contents = contents,
        _location = location;

  BoardModel toMap() {
    return BoardModel(
        boardId: _boardId,
        contents: _contents,
        title: _title,
        location: _location);
  }

  factory BoardModel.fromJson(Map<String, dynamic> map) {
    return BoardModel(
        boardId: map['boardId'] as int,
        contents: map['contents'] as String,
        title: map['title'] as String,
        location: map['region'] as String);
  }

  String toJson() => json.encode(toMap());
}
