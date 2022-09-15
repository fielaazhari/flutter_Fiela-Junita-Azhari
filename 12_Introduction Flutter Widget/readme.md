# (12) Introduction Flutter Widget
Nomor Urut: 1_011FLB_40

Nama: Fiela Junita Azhari

## Summary
Pada section ini saya belajar tentang Introduction Flutter Widget.
3 poin yang saya dapatkan saat pembelajaran pada section ini adalah:
1. Flutter adalah alat pengembangan antarmuka pengguna yang digunakan untuk membuat aplikasi mobile, desktop, dan web. keunggulan flutter adalah, mudah digunakan serta dipelajari, produktivitas tinggi, dokumentasi terbilang lengkap, dan komunitas sangat berkembang.
2. widget digunakan untuk membentuk antarmuka (UI), widget berupa class dapat terdiri dari beberapa widget lainnya. jenis widget ada 2 yaitu stateless dan stateful.
stateless tidak bergantung pada perubahan data dan hanya fokus pada tampilan, dibuat dengam extend pada class StatelessWidget. 
Sementara stateful widget mementingkan pada perubahan data yang dibuat dengan extend pada class StatefylWidget, 1 widget menggunakan 2 class yaitu widget dan state.
3. Built in Widget adalah widget yang dapat langsung digunakan dan biasanya sudah langsung ter-install bersama flutter. terdiri dari MaterialApp, Scaffold, AppBar, Text.

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
