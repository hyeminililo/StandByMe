import 'package:flutter/foundation.dart';
import 'package:flutter_sc/Model/Data/UserInfo.dart';

class UserInfoProvider with ChangeNotifier {
  UserInfo? _userInfo;
  UserInfo? get userInfo => _userInfo;

  set userInfo(UserInfo? userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }
}
