import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:telegram/json/chat_json.dart';
import 'package:telegram/widgets/drawer.dart';

import '../json/chat_json.dart';

class Cupertino extends StatefulWidget {
  const Cupertino({Key? key}) : super(key: key);

  @override
  State<Cupertino> createState() => _CupertinoState();
}

class _CupertinoState extends State<Cupertino> {
  String? _currentText;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            previousPageTitle: "asdsad",
            leading: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Text("Edit"),
                onPressed: () {}),
            middle: const Text("Chats"),
            largeTitle: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: CupertinoSearchTextField(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 130),
                      child: Icon(
                        CupertinoIcons.search,
                        size: 20,
                      ),
                    ),
                    controller: TextEditingController(text: ''),
                    placeholder: 'Search',
                  ),
                ),
              ],
            ),
            trailing: const Icon(CupertinoIcons.add),
          ),
          SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(childCount: 1,
                      (context, index) {
                return CupertinoSegmentedControl(
                  borderColor: Colors.white,
                  // groupValue: groupValue,
                  pressedColor: Colors.blue,
                  children: {
                    'All Chats': buildSegment("All Chats"),
                    'Work': buildSegment("Work"),
                    'Unread': buildSegment("Unread"),
                    'Personal': buildSegment("Personal")
                  },
                  onValueChanged: (String value) {
                    setState(() {
                      _currentText = value;
                    });
                  },
                );
              }))),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: chat_data.length,
                (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(chat_data[index]['img']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Container(
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: (size.width - 40) * 0.6,
                                      child: Text(
                                        chat_data[index]['name'],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Text(
                                      chat_data[index]['date'],
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.4),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  width: (size.width - 40) * 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        chat_data[index]['text'],
                                        style: TextStyle(
                                            fontSize: 14,
                                            height: 1.3,
                                            color:
                                                Colors.black.withOpacity(0.3)),
                                      ),
                                      chat_data[index]['badge'] > 0
                                          ? Badge(
                                              badgeColor: Colors.green,
                                              badgeContent: Padding(
                                                padding:
                                                    const EdgeInsets.all(1),
                                                child: Text(
                                                  chat_data[index]['badge']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSegment(String text) => Container(
        padding: const EdgeInsets.all(12),
        color:
            _currentText == text ? Colors.blue.withOpacity(0.2) : Colors.white,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      );
}
