import 'package:flutter/material.dart';
import 'package:section15/user.dart';

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
          title: Text("JSON ListView in Flutter"),
        ),
        body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Text(
                      user[index]["name"][0],
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    radius: 30,
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user[index]["name"]),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        (user[index]["phone"]),
                        style: TextStyle(color: Colors.black.withOpacity(0.4)),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
