// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sc/Model/Data/Url.dart';
import 'package:flutter_sc/Model/Data/UserInfo/UserInfoDB.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//DB에 게시판 작성 데이터 저장하는 함수
class BoardCreateDB extends ChangeNotifier {
  UserInfoDB userInfoDB = UserInfoDB();
  Long? boardId;
  String? title;
  String? contents;
  String? location;

  BoardCreateDB({
    this.boardId,
    this.title,
    this.contents,
    this.location,
  });

  factory BoardCreateDB.fromJson(Map<String, dynamic> json) {
    return BoardCreateDB(
      boardId: json['BoardId'],
      title: json['title'],
      contents: json['contents'],
      location: json['region'],
    );
  } // 나중에 try-catch 문으로 감싸기

  Future<http.Response> saveBoardDB(
      String title, String contents, String location) async {
    final Future<SharedPreferences> prefsFu = SharedPreferences.getInstance();
    SharedPreferences prefs = await prefsFu;

    String token = prefs.getString('accessToken') ?? '';

    Map<String, String> headers = {
      "Authorization": "Bearer $boardId",
      "Content-Type": "application/json",
      "accept": "application/json"
    };
    Map data = {'title': title, 'contents': contents, 'region': location};
    var body = json.encode(data);
    var response = await http.post(
        Uri.parse(
            'http://43.202.221.163:8091/board/create?boardRequestDto=$boardId&member=${userInfoDB.id}'),
        headers: headers,
        body: body);
    print('saveBoardDB: ${response.statusCode}');
    print('saveBoardDB body: ${response.body}');
    return response;
  }

// DB에 있는 데이터를 리스트로 가져오는 함수
  Future<List<dynamic>> fetchPost() async {
    http.Response response = await http.get(Uri.parse(BOARD_FETCH_URL));

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> body = jsonDecode(response.body);
      return body;
    } else {
      //  print('Response stauts : ${response.statusCode}');
      // print('Response body : ${response.body}');

      throw "Unable to retrieve posts.";
    }
  }

// DB에 있는 데이터를 가져오는 함수
  Future<BoardCreateDB> fetchBoardDB() async {
    final response = await http.get(Uri.parse(BOARD_FETCH_URL));
    //  print('Response stauts : ${response.statusCode}');
    //  print('Response body : ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return BoardCreateDB.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Board DB');
    }
  }

  Future<void> getBoardList() async {
    // final routeFromJsonFile =
    //     await rootBundle.loadString('assets/json/g_user_details.json');
    // final userinfoDBList =
    //     UserInfoDBList.fromJson(routeFromJsonFile).userinfoDbs ??
    //         <UserInfoDB>[];
    // print("====== userInfoDBList ${userinfoDBList[0]}");

    final routeFromJsonFile =
        await rootBundle.loadString('assets/json/board_create.json');
    Map<String, dynamic> userInfoMap = json.decode(routeFromJsonFile);

    final userinfoDB = UserInfoDB.fromJson(userInfoMap);

    userinfoDB.id = userinfoDB.id;
    userinfoDB.displayName = userinfoDB.displayName;
    userinfoDB.email = userinfoDB.email;

    print("====== userInfoDBList ${userinfoDB.id}");

    notifyListeners();
  }
}
