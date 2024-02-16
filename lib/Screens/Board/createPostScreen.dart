import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/Data/Board/MainBoardDB.dart';
import 'package:flutter_sc/Model/Provider/BoardProvider.dart';
import 'package:flutter_sc/Model/common/DropDown/country.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'package:flutter_sc/Model/common/widget/textFormField.dart';
import 'package:flutter_sc/Model/common/widget/TabBar.dart';
import 'package:flutter_sc/Model/common/widget/appBar.dart';
// import 'package:flutter_sc/Model/common/widget/appBar.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_sc/Model/Data/Board/BoardModel.dart';
import 'package:provider/provider.dart';

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

  // textFormField를 통해 받은 값들
  TFF tffTitle = TFF(textFormField: TextFormField(), cnc: 'Title');
  TFF tffPost = TFF(textFormField: TextFormField(), cnc: 'Writing...');
  String dropdownValueLocal = maplocal.keys.first;

  @override
  Widget build(BuildContext context) {
    BoardProvider boardProvider =
        Provider.of<BoardProvider>(context, listen: false); // 지역 선택된 값 보여주기

    BoardDetailsDB db = BoardDetailsDB(
        title: tffTitle.toString(),
        contents: tffPost.toString(),
        location: dropdownValueLocal);

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
                                          onPressed: () async => {
                                                context.go('/mainBoard'),
                                                //          db.saveBoardDb(
                                                tffTitle.toString(),
                                                tffPost.toString(),
                                                //            dropdownValueLocal)
                                              },
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
                        },
                        selectedItemBuilder: (BuildContext context) {
                          return maplocal.values.map<Widget>((String item) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              constraints: const BoxConstraints(minWidth: 100),
                              child: Text(
                                item,
                                style: const TextStyle(
                                  color: PRIMARYCOLOR,
                                ),
                              ),
                            );
                          }).toList();
                        },
                        items: maplocal.keys
                            .map<DropdownMenuItem<String>>((String item) {
                          return DropdownMenuItem<String>(
                              value: item, child: Text(item));
                        }).toList(),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
                      ),
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
