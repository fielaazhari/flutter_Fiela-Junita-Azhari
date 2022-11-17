import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/cupertino/cupertino_home.dart';
import 'package:task/home.dart';


void main() {
  runApp(const CupertinoApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoHome();
    } else {
      return const Home();
    }
  }
}
