import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sc/Model/common/client.dart';

// 번역을 위한 api
class Translation {
  final dio = Dio();

  Future<String> translatedText() async {
    String translationResult = '';
    dynamic response = await dio.post(
        'https://openapi.naver.com/v1/papago/n2mt',
        data: {
          'source': 'ko',
          'target': 'en',
          'text': '이 부분에 받는것을 어떻게 해야할까 ,,'
        },
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
          'X-Naver-Client-Id': TRANSLATE_CLIENT_ID,
          'X-Naver-Client-Secret': TRANSLATE_CLIENT_SECRET,
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      final translatedText = data['message']['result']['translatedText'];
      translationResult = translatedText;
    } else {
      translationResult = '번역 실패 : ${response.statusCode}';
    }

    return translationResult;
  }
}
