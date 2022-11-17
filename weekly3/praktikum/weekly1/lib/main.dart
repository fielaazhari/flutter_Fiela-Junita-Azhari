import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly1/pages/home/home_page.dart';
import 'package:weekly1/pages/home/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weekly Task 1',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const HomePage()),
    );
  }
}
