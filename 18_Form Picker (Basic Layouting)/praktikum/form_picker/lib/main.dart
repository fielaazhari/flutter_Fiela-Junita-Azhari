import 'package:flutter/material.dart';

import 'create_post_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Create Post',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CreatePostPage(),
    );
  }
}
