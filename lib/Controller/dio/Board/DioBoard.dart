import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/Board/BoardModel.dart';
import 'package:flutter_sc/Model/Data/Url.dart';
import 'package:http/http.dart' as http;

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
