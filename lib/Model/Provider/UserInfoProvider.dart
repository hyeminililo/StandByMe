import 'package:flutter/foundation.dart';
import 'package:flutter_sc/Model/Data/UserInfo/UserInfoDB.dart';

class UserInfoProvider with ChangeNotifier {
  UserInfoDB? _userInfo;
  UserInfoDB? get userInfo => _userInfo;

  set userInfo(UserInfoDB? userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }
}
