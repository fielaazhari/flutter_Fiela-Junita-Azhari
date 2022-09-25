import 'package:flutter/material.dart';
import 'package:task/list.dart';

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
          title: Text("Assets"),
        ),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: imageApp.length,
          physics: ScrollPhysics(), // hapus kalau tidak perlu pakai scroll
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyNewPage(
                      halaman: imageApp[index],
                    ),
                  ),
                );
              },
              icon: Image.network(imageApp[index]["images"]),
            ),
          ),
        ),
      ),
    );
  }
}

class MyNewPage extends StatefulWidget {
  MyNewPage({this.halaman});
  final halaman;

  @override
  State<MyNewPage> createState() => _MyNewPageState();
}

class _MyNewPageState extends State<MyNewPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("NewPage"),
        ),
        body: Image.network(
          widget.halaman["images"],
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
