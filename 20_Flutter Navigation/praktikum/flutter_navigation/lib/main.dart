import 'package:contact/contacts_page.dart';
import 'package:contact/page/add_user_pushnamed.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) => const ContactsPage(),
        '/adduser': (_) => AddUserPushnamed()
      },
      title: 'Contacts',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
