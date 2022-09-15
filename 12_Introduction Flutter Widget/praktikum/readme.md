# (12) Introduction Flutter Widget
Nomor Urut: 1_011FLB_40

Nama: Fiela Junita Azhari

## Task
### Input
#### change_time.dart
    import 'dart:async';
    import 'package:flutter/material.dart';

    class ChangeTime extends StatefulWidget {
    const ChangeTime({Key? key}) : super(key: key);

    @override
    State<ChangeTime> createState() => _ChangeTimeState();
    }

    class _ChangeTimeState extends State<ChangeTime> {
    Timer? timer;

    String time() {
        return "${DateTime.now().hour < 10 ? "0${DateTime.now().hour}" : DateTime.now().hour}:${DateTime.now().minute < 10 ? "0${DateTime.now().minute}" : DateTime.now().minute}:${DateTime.now().second < 10 ? "0${DateTime.now().second}" : DateTime.now().second} ";
    }

    @override
    void initState() {
        super.initState();
        timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        setState(() {});
        });
    }

    // @override
    // void dispose() {
    //   timer!.cancel();
    //   super.dispose();
    // }

    @override
    Widget build(BuildContext context) {
        return Center(
        child: Text(
            time(),
            style: const TextStyle(fontSize: 40),
        ),
        );
    }
    }

#### main.dart
    // import 'dart:html';

    import 'change_time.dart';
    import 'package:flutter/material.dart';

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
            title: const Text('Changed Time'),
            ),
            body: ChangeTime(),
        ),
        );
    }
    }
