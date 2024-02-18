// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_sc/ExampleMainBoard/mainBoardDAO.dart';

class ExampleMainBoardModel {
  int? id;
  String? title;

  String? contents;
  DateTime? createdTime;
  String? location;

  ExampleMainBoardModel(
      {required this.id,
      required this.title,
      required this.contents,
      required this.createdTime,
      required this.location});

  factory ExampleMainBoardModel.fromDatabaseJson(Map<String, dynamic> data) =>
      ExampleMainBoardModel(
        id: data['id'],
        title: data['title'],
        contents: data['contents'],
        location: data['location'],
        createdTime:
            DateTime.fromMillisecondsSinceEpoch(data['created_time'] as int),
      );
  Map<String, dynamic> toDatabaseJson() => {
        'title': title,
        'created_time': createdTime!.millisecondsSinceEpoch,
        'contents': contents,
        'location': location
      };
}
