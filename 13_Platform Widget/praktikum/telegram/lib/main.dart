import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram/cupertino/cupertino_home.dart';
import 'package:telegram/home.dart';

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
