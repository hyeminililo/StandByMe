import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/DropDown/country.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'package:flutter_sc/Model/common/widget/textFormField.dart';
import 'package:flutter_sc/Model/common/widget/TabBar.dart';
import 'package:flutter_sc/Model/common/widget/appBar.dart';
//import 'package:flutter_sc/Model/common/widget/appBar.dart';
import 'package:go_router/go_router.dart';

class CreatPostScreen extends StatefulWidget {
  final Function(String, String)? onDropdownValueChanged;

  const CreatPostScreen({Key? key, this.onDropdownValueChanged})
      : super(key: key);

  @override
  State<CreatPostScreen> createState() => _CreatPostScreenState();
}

//formkey로 받은 것들이 한 번에 넘어갈 수 있는지 ex) 하나의 정보 게시팜 모델테이블에 넣어서 담아갈 수 있는?ㅇ
class _CreatPostScreenState extends State<CreatPostScreen> {
  final _formKey = GlobalKey<FormState>();
  TFF tffTitle = TFF(textFormField: TextFormField(), cnc: 'Title');
  TFF tffPost = TFF(textFormField: TextFormField(), cnc: 'Writing...');
  String dropdownValueLocal = listLocal.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBase(title: 'creatPost'),
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // 완료 버튼 -> 모든 값이 null 상태가 아니면 게시판으로 넘어가기
                  Container(
                    padding: const EdgeInsets.fromLTRB(250, 0, 0, 0),
                    child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: const Text('Post?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              context.go('mainBoard'),
                                          child: const Text('Sumbit')),
                                      TextButton(
                                          onPressed: () => context.pop(),
                                          child: const Text('Cancel'))
                                    ],
                                  );
                                });
                          }
                        },
                        child: const Text('Complete')),
                  ),

                  SizedBox(
                      width: 350, height: 80, child: tffTitle.textFormField),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0)),
                      // 지역 필터 설정
                      DropdownButton<String>(
                        focusColor: BODY_TEXT_COLOR,
                        dropdownColor: MAIN_TEXT_COLOR,
                        value: dropdownValueLocal,
                        hint: const Row(
                          children: [
                            Icon(Icons.arrow_drop_down),
                            Text('Local'),
                          ],
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValueLocal = value!;
                          });
                          widget.onDropdownValueChanged!(
                              dropdownValueLocal, dropdownValueLocal);
                        },
                        items: listLocal
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
                      ),
                      // 사진 업로드
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt),
                        iconSize: 45,
                      )
                    ],
                  ),
                  // 글쓰기
                  SizedBox(
                    width: 350,
                    height: 500,
                    child: tffPost.textFormField,
                  )
                ],
              ))),
      bottomNavigationBar: const TabBarBase(),
    );
  }
}
