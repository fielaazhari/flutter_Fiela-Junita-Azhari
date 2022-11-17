import 'package:dio/dio.dart';
import 'package:dio_rest_api/models/user_model.dart';
import 'package:flutter/material.dart';

class UserAPI {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> fetchUser() async {
    try {
      final Response response = await dio.get('https://reqres.in/api/users');

      debugPrint(response.data.toString());

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserDio>> fetchData() async {
    try {
      final Response response = await dio.get('https://reqres.in/api/users');

      debugPrint(response.data.toString());

      List<UserDio> dataUser = (response.data['data'] as List)
          .map((e) => UserDio.fromJson(e))
          .toList();

      return dataUser;
    } catch (e) {
      rethrow;
    }
  }

  Future createUser({required String name, required String job}) async {
    try {
      final Response response = await dio.post(
        'https://reqres.in/api/users',
        data: {
          'name': name,
          'job': job,
        },
      );

      debugPrint(response.data.toString());

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future updateUser({required String name, required String job}) async {
    try {
      final Response response = await dio.put(
        'https://reqres.in/api/users/4',
        data: {
          'name': name,
          'job': job,
        },
      );

      debugPrint(response.data.toString());

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteUser() async {
    try {
      final Response response = await dio.delete(
        'https://reqres.in/api/users/4',
      );

      debugPrint(response.data.toString());
    } catch (e) {
      rethrow;
    }
  }
}
