import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BarcodePage extends StatelessWidget {
  const BarcodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all()),
            height: 100,
            width: 200,
            child: BarcodeWidget(
              height: 2,
              barcode: Barcode.code128(),
              data: 'Alterra Academy',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            height: 100,
            width: 200,
            child: BarcodeWidget(
              height: 2,
              barcode: Barcode.code128(),
              data: 'Flutter Asik',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            height: 100,
            width: 200,
            child: BarcodeWidget(
              height: 2,
              barcode: Barcode.code128(),
              data: 'Fiela Junita Azhari',
            ),
          ),
        ],
      ),
    );
  }

  static code128() {}
}
