import 'package:flutter/cupertino.dart';
import 'package:telegram/cupertino/cupertino_page.dart';

class CupertinoHome extends StatelessWidget {
  const CupertinoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle_fill), label: "Contacs"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone_fill), label: "Calls"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2_fill), label: "Chats"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings), label: "Settings"),
      ]),
      tabBuilder: (context, index) {
        switch (index) {
          default:
            return const Cupertino();
        }
      },
    );
  }
}
