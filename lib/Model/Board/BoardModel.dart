// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class BoardModel extends ChangeNotifier {
  int? _boardId;
  String? _contents;
  String? _title;
  String? _location;

  BoardModel(
      {required int? boardId,
      required String? title,
      required String? contents,
      required String? location})
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
