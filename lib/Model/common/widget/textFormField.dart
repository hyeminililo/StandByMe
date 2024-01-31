import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/color.dart';

class TFF {
  String cnc;
  TextFormField textFormField;

  TFF({required this.textFormField, required this.cnc}) {
    textFormField = TextFormField(
        decoration: InputDecoration(
          labelText: '$cnc',
          filled: true,
          fillColor: BODY_TEXT_COLOR,
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: BODY_TEXT_COLOR)),
          border:const  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: BODY_TEXT_COLOR)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some $cnc';
          }
          return null;
        });
  }
}
