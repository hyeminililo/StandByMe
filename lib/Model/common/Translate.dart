import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sc/Model/common/client.dart';

class Translation extends StatefulWidget {
  const Translation({super.key});

  @override
  State<Translation> createState() => _TranslationState();
}

class _TranslationState extends State<Translation> {
  final dio = Dio();
  String translationResult = '';

  Future<void> translatedText() async {
    final response = await dio.post('https://openapi.naver.com/v1/papago/n2mt',
        data: {
          'source': 'ko',
          'target': 'en',
          'text': '이 부분에 받는것을 어떻게 해야할까 ,,'
        },
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
          'X-Naver-Client-Id': CLIENT_ID,
          'X-Naver-Client-Secret': CLIENT_SECRET,
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      final translatedText = data['message']['result']['translatedText'];
      setState(() {
        translationResult = translatedText;
      });
    } else {
      setState(() {
        translationResult = '번역 실패 : ${response.statusCode}';
      });
    }
  }
}
