import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

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
            title: Text("Barcode"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: 'Altera Academy',
                  width: 300,
                  height: 150,
                ),
                SizedBox(height: 50),
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: 'Flutter Asik',
                  width: 300,
                  height: 150,
                ),
                SizedBox(height: 50),
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: 'Fiela Junita Azhari',
                  width: 300,
                  height: 150,
                )
              ],
            ),
          )),
    );
  }
}
