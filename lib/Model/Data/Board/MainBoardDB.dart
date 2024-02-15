import 'package:flutter_sc/Model/Data/Url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//DB에 게시판 작성 데이터 저장하는 함수
class BoardDetailsDB {
  Future initDB() async {}

  Future<http.Response> saveBoardDb(
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
}
