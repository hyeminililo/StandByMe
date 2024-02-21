import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/Data/Board/BoardModel.dart';

class BoardProvider with ChangeNotifier {
  BoardModel? _boardModel;
  BoardModel? get boardModel => _boardModel;

  set boardModel(BoardModel? boardModel) {
    _boardModel = boardModel;
    notifyListeners();
  }

  void updateBoardModel(BoardModel newBoardModel) {
    _boardModel = newBoardModel;
    notifyListeners();
  }
}
