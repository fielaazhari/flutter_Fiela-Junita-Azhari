import 'package:dio_rest_api/models/api/user_api.dart';
import 'package:dio_rest_api/models/user_model.dart';
import 'package:flutter/material.dart';


class HomeViewModel with ChangeNotifier {
  List<UserDio> _user = [];
  String _result = '';

  List<UserDio> get user => _user;
  String get result => _result;

  getAllUsers() async {
    final response = await UserAPI().fetchUser();
    _result = response.toString();
    notifyListeners();
  }

  createUser(String name, String job) async {
    final response = await UserAPI().createUser(name: name, job: job);
    _result = response.toString();
    notifyListeners();
  }

  updateUser(String name, String job) async {
    final response = await UserAPI().createUser(name: name, job: job);
    _result = response.toString();
    notifyListeners();
  }

  deleteUser() async {
    final response = await UserAPI().deleteUser();
    _result = response.toString();
    notifyListeners();
  }

  getUsers() async {
    final response = await UserAPI().fetchData();
    _user = response;
    notifyListeners();
  }
}
