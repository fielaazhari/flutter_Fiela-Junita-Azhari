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
