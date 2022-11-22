import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:telegram/widgets/drawer.dart';

import 'json/chat_json.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const Text("Telegram"),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: getListChats(),
      ),
    );
  }

  Widget getListChats() {
    var size = MediaQuery.of(context).size;
    return Column(
        children: List.generate(
      chat_data.length,
      (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (size.width - 40) * 0.6,
                          child: Text(
                            chat_data[index]['name'],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            chat_data[index]['text'],
                            style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                color: Colors.black.withOpacity(0.3)),
                          ),
                          chat_data[index]['badge'] > 0
                              ? Badge(
                                  badgeColor: Colors.green,
                                  badgeContent: Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: Text(
                                      chat_data[index]['badge'].toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
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
              ))
            ],
          ),
        );
      },
    ));
  }
}
