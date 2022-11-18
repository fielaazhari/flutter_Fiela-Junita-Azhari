import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/models/foods.dart';

class FoodService {
  final Dio dio = Dio();

  Future<List<Foods>?> fetchFood() async {
    try {
      final Response response = await dio.get(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods');

      debugPrint(response.data.toString());

      List<Foods> foods =
          (response.data as List).map((e) => Foods.fromJson(e)).toList();

      return foods;
    } catch (e) {
      rethrow;
    }
  }
}
