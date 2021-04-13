import 'package:flutter/material.dart';
import 'package:testapp/proxyprovider/user.dart';

class UserProvider with ChangeNotifier {
  User _user;
  User get user => _user;

  setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
