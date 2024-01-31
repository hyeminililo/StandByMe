import 'package:flutter/cupertino.dart';

class BoardModel extends ChangeNotifier {
  int commentCount = 0;
  int heartCount = 0;

  String comment = '';
  String title='';
  BoardModel(this.commentCount, this.heartCount, this.comment, this.title);
}
