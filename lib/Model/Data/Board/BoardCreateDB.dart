// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sc/Model/Data/TokenKey.dart';
import 'package:flutter_sc/Model/Data/Url.dart';
import 'package:flutter_sc/Model/Data/UserInfo/UserInfoDB.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// Function to save bulletin board creation data in DB
class BoardCreateDB extends ChangeNotifier {
  UserInfoDB userInfoDB = UserInfoDB();
  Long? _boardId;
  String? _title;
  String? _contents;
  String? _location;

  BoardCreateDB(
      {Long? boardId, String? title, String? contents, String? location})
      : _boardId = boardId,
        _contents = contents,
        _location = location,
        _title = title;

//provider
  Long? get boardId => _boardId;
  set boardId(Long? value) {
    _boardId = value;
    notifyListeners();
  }

  String? get contents => _contents;
  set contents(String? value) {
    _contents = value;
    notifyListeners();
  }

  String? get title => _title;
  set title(String? value) {
    _title = value;
    notifyListeners();
  }

  String? get location => _location;
  set location(String? value) {
    _location = location;
    notifyListeners();
  }

  BoardCreateDB toMap() {
    return BoardCreateDB(
        boardId: _boardId,
        contents: _contents,
        title: _title,
        location: _location);
  }

  factory BoardCreateDB.fromJson(Map<String, dynamic> json) {
    return BoardCreateDB(
      boardId: json['boardId'] as Long,
      title: json['title'] as String,
      contents: json['contents'] as String,
      location: json['region'] as String,
    );
  }
  // Function to save the content written on the bulletin board in the DB
  Future<http.Response> saveBoardDB(
      String title, String contents, String location) async {
    final Future<SharedPreferences> prefsFu = SharedPreferences.getInstance();
    SharedPreferences prefs = await prefsFu;

    String token = prefs.getString('accessToken') ?? '';
//      'Authorization': 'Bearer $token';
    Map<String, String> headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json;charset=UTF-8',
    };
    Map data = {'title': title, 'contents': contents, 'region': location};
    var body = json.encode(data);
    var response = await http.post(Uri.parse(BOARD_CREATE_URL),
        headers: headers, body: body);
    print('saveBoardDB: ${response.statusCode}');
    print('saveBoardDB: ${response.body}');
    print('**********');

    return response;
  }

// Function to retrieve data from DB as a list
  Future<List<dynamic>> fetchPosts() async {
    Map<String, String> headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $ACESS_TOKEN_KEY',
      'Content-Type': 'application/json;charset=UTF-8',
    };

    http.Response response = await http.get(Uri.parse(BOARD_FETCH_URL), headers: headers);
    dynamic jsonData = jsonDecode(response.body);
    print('--------------');
    print('fetchPosts: ${response.statusCode}');

    print('fetchPost Body: ${response.body}');
    if (jsonData is List) {
      return jsonData;
    } else if (jsonData is Map<String, dynamic>) {
      return [jsonData].toList();
    } else {
      throw Exception('Invalid response data');
    }
  }

  //Function to retrieve data from DB
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
    Map<String, dynamic> boardCreateMap = json.decode(routeFromJsonFile);

    final boardCreateDB = BoardCreateDB.fromJson(boardCreateMap);

    boardCreateDB.boardId = boardCreateDB.boardId;
    boardCreateDB.contents = boardCreateDB.contents;
    boardCreateDB.location = boardCreateDB.location;
    boardCreateDB.title = boardCreateDB.title;

    print("====== BoardLDBList contents :  ${boardCreateDB.contents}");

    notifyListeners();
  }
}
