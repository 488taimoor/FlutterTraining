import 'package:flutter/material.dart';
import 'package:testapp/proxyprovider/user.dart';
import 'package:testapp/proxyprovider/userProvider.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider({UserProvider userProvider}) : _userProvider = userProvider;

  UserProvider _userProvider;

  String get greeting => "Hello, ${_userProvider.user.username}";

  setUser(User user) {
    _userProvider.setUser(user);
    notifyListeners();
  }
}
