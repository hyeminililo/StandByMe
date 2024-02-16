// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sc/Model/Data/Url.dart';
import 'package:http/http.dart' as http;

//DB에 게시판 작성 데이터 저장하는 함수
class BoardDetailsDB {
  Long? boardId;
  String? title;
  String? contents;
  String? location;

  BoardDetailsDB({
    this.boardId,
    required this.title,
    required this.contents,
    required this.location,
  });

  // 나중에 try-catch 문으로 감싸기
  Future<http.Response> saveBoardDB(
      String title, String contents, String location) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    Map data = {'title': title, 'contents': contents, 'region': location};
    var body = json.encode(data);
    var response = await http.post(Uri.parse(BOARD_CREATE_URL),
        headers: headers, body: body);
    print(response.statusCode);
    print(response.body);
    return response;
  }

  // DB에 있는 데이터를 가져오는 함수
//  Future<http.Request> fetchBoardDB() {}
//  StreamBuilder<QuerySnapshot>();
}
