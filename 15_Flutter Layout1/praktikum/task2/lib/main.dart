import 'package:flutter/material.dart';
import 'package:task2/icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridView"),
        ),
        body: GridView.count(
          crossAxisCount: 4,
          children: List.generate(IconApp.length, (index) {
            return Padding(
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.blue,
                child: Icon(
                  IconApp[index],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
