import 'package:flutter/material.dart';
import 'package:weekly1/models/m_user.dart';

class HomeViewModel extends ChangeNotifier {
  final List<User> _users = [];
  List<User> get users => _users;

  addUser(User user) {
    _users.add(user);
    notifyListeners();
  }
}
