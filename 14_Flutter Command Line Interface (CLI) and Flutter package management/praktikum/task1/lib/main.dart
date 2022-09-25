import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

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
            title: Text("Badge"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Chip(
                  padding: EdgeInsets.all(10),
                  backgroundColor: Colors.deepPurple,
                  label: Text('BADGE',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
                SizedBox(height: 10),
                Badge(
                  toAnimate: false,
                  shape: BadgeShape.square,
                  padding: EdgeInsets.all(10),
                  badgeColor: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(30),
                  badgeContent: Text('BADGE',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ],
            ),
          )),
    );
  }
}
