import 'dart:convert';
import 'package:flutter_sc/Model/Data/Board/BoardModel.dart';
import 'package:flutter_sc/Model/Data/Url.dart';
import 'package:http/http.dart' as http;

// 서버에서 받기
Future<BoardModel> fetchBoard() async {
  final response = await http.post(Uri.parse(BOARD_CREATE_URL));
  if (response.statusCode == 200 || response.statusCode == 201) {
    Map<String, dynamic> json = jsonDecode(response.body);
    BoardModel boardModel = BoardModel.fromJson(json);
    print('board data success');
    return boardModel;
  } else {
    throw Exception('Failed ,,,');
  }
}

//서버에 데이터 보내기
Future<void> sendToData() async {
  final data = {'title': '', 'contents': '', 'locale': ''};
  final response = await http.post(Uri.parse(BOARD_CREATE_URL),
      headers: {'Content-Type': 'application/json'}, body: json.encode(data));
  if (response.statusCode == 200 || response.statusCode == 201) {
    print('데이터 전송 완료');
  } else {
    print('데이터 전송 실패 : ${response.statusCode}');
  }
}
