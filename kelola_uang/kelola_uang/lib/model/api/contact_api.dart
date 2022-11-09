import 'package:kelola_uang/model/contact_model.dart';
import 'package:dio/dio.dart';

class ContactAPI {
  static Future<List<Contact>> getContact() async {
    final response = await Dio().get(
      path);

      List<Contact> contacts = (response.data as List).map((e) => Contact(id:))
  }
}
