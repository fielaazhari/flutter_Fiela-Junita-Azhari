import 'package:dio/dio.dart';

final Dio dio = Dio();

final Response response = await dio.get(
  'https://api.jepriana.com/contacts'
);