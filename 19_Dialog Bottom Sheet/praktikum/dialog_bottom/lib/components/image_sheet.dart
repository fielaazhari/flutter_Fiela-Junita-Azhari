import 'package:flutter/material.dart';

class ImageSheet extends StatelessWidget {
  final imgList;
  const ImageSheet({super.key, required this.imgList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Image.network(
        imgList,
        fit: BoxFit.cover,
      ),
    );
  }
}
