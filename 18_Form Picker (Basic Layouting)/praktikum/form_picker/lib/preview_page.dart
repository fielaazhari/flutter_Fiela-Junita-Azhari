// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PreviewPage extends StatefulWidget {
  final dateinput;
  final currentColor;
  final caption;
  final coverImage;

  const PreviewPage(
      {super.key,
      required this.dateinput,
      required this.currentColor,
      required this.caption,
      required this.coverImage});

  // const PreviewPage(
  //     {this.dateinput, this.currentColor, this.caption, this.coverImage});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Preview Post'),
      ),
      body: Column(
        children: [
          // if (widget.coverImage != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              width: 400,
              child: Image.file(widget.coverImage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text('Published:'),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat.yMMMd().format(widget.dateinput)),
                      Row(
                        children: [
                          const Text('Color: '),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.currentColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.caption,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
