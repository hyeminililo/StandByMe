import 'package:flutter/cupertino.dart';

class BoardModel extends ChangeNotifier {
  int commentCount = 0;
  int likelyCount = 0;

  String comment = '';
  String title = '';
  BoardModel(this.commentCount, this.likelyCount, this.comment, this.title);
}
