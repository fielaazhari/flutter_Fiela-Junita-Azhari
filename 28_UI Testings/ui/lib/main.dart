import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/contact/contact_bloc.dart';
import 'package:state_management/bloc/theme/theme_bloc.dart';
import 'package:state_management/pages/home_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactBloc()..add(LoadContact()),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeData dark = ThemeData.dark();
  final ThemeData light = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) => MaterialApp(
        theme: state.themeData,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
