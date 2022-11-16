import 'package:dialog_bottom/components/image_sheet.dart';
import 'package:dialog_bottom/json/image_json.dart';
import 'package:flutter/material.dart';


class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: GridView.builder(
        itemCount: images.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: InkWell(
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      content: ImageSheet(
                    imgList: images[index],
                  )),
                );
              },
              onTap: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) => ImageSheet(
                          imgList: images[index],
                        ));
              },
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
