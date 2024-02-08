import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:flutter_sc/Model/Data/User_real.dart';

Future<Member> fetchUser() async {
  final response = await http.get(Uri.parse('http://localhost'));

  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    Member member = Member.fromJson(json);
    return member;
  } else {
    throw Exception('Failed to fetch memer');
  }
}
