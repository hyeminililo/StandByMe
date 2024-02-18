// // 나중에 try-catch 문으로 감싸기
import 'dart:convert';

import 'package:flutter_sc/Model/Data/Board/MainBoardDB.dart';
import 'package:flutter_sc/Model/Data/Url.dart';
import 'package:http/http.dart' as http;

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

// // DB에 있는 데이터를 리스트로 가져오는 함수
// Future<List<dynamic>> fetchPost() async {
//   http.Response res = await http.get(Uri.parse(BOARD_FETCH_URL));
//   if (res.statusCode == 200 || res.statusCode == 201) {
//     List<dynamic> body = jsonDecode(res.body);
//     return body;
//   } else {
//     throw "Unable to retrieve posts.";
//   }
// }

// // DB에 있는 데이터를 가져오는 함수
// Future<BoardDetailsDB> fetchBoardDB() async {
//   final response = await http.get(Uri.parse(BOARD_FETCH_URL));
//   if (response.statusCode == 200 || response.statusCode == 201) {
//     return BoardDetailsDB.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load Board DB');
//   }
// }
