import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/DropDown/Gender.dart';
import 'package:flutter_sc/Model/Data/UserInfo.dart';
import 'package:go_router/go_router.dart';
import '/Model/common/DropDown/country.dart';
import '/Model/common/color.dart';
//import '../Model/User.dart';

class JoinScreen extends StatefulWidget {
  final Function(String, String)? onDropdownValueChanged;

  const JoinScreen({Key? key, this.onDropdownValueChanged}) : super(key: key);

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final _formKey = GlobalKey<FormState>();

  String dropdownValueCountry = listCountry.first;
  String dropdownValueGender = listGender.first;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARYCOLOR,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              padding, padding,
              const Text('Stand By Me',
                  style: TextStyle(fontSize: 50, color: MAIN_TEXT_COLOR)),
              const Text('Join',
                  style: TextStyle(fontSize: 40, color: MAIN_TEXT_COLOR)),
              const Padding(padding: EdgeInsets.only(top: 20)),
              //TextFormField를 별도 파일로 만들어서 하면 어떨지 ...?

              // dropdownButton을 사이즈 조절하고 싶은...
              DropdownButton<String>(
                focusColor: BODY_TEXT_COLOR,
                dropdownColor: MAIN_TEXT_COLOR,
                value: dropdownValueCountry,
                disabledHint: const Text('country'),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValueCountry = value!;
                  });
                  widget.onDropdownValueChanged!(
                      dropdownValueCountry, dropdownValueGender);
                },
                items:
                    listCountry.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
              ),
              DropdownButton<String>(
                //이거 확인 !!!!!!!!
                isExpanded: false,
                //              focusColor: BODY_TEXT_COLOR,
//                dropdownColor: MAIN_TEXT_COLOR,
                value: dropdownValueGender,
                onChanged: (String? value) {
                  setState(() {
                    dropdownValueGender = value!;
                  });
                  widget.onDropdownValueChanged!(
                      dropdownValueCountry, dropdownValueGender);
                },
                disabledHint: const Text('Gender'),
                items: listGender.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
              ),
              padding,
              ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState;
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                  if (form == null || !form.validate()) {
                    return;
                  }
                  //  Member member = Member(dropDownValueCountry:dropdownValueCountry, dropDownValueGender:dropdownValueGender);
                  //widget.onDropdownValueChanged!(
                  //  member.dropDownValueCountry!,
                  //  member.dropDownValueGender!,

                  //);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MAIN_TEXT_COLOR,
                  shadowColor: SHADOW_TEXT_COLOR,
                ),
                child: const Text('Join'),
              ),
              Center(
                  child: Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 100)),
                  const Text('Already hava an account?'),
                  TextButton(
                    onPressed: () => context.go('/login'),
                    child: const Text(
                      'Log in',
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
