import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            isBig = !isBig;
            setState(() {});
          },
          child: AnimatedContainer(
            height: isBig ? 300 : 200,
            width: isBig ? 300 : 200,
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              'assets/kucing.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
