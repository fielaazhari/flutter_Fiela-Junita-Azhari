import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: const EdgeInsets.only(top: 0),
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text(
            "Rayhan Naufal",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          accountEmail: const Text("+62 82299982018"),
          currentAccountPicture: GestureDetector(
            onTap: () {},
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.group),
          title: const Text("New Group"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.lock),
          title: const Text("New Secret Chat"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.create_new_folder),
          title: const Text("New Channel"),
          onTap: () {},
        ),
        const Divider(
          height: 18,
          color: Colors.black45,
        ),
        ListTile(
          leading: const Icon(Icons.contacts),
          title: const Text("Contacts"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.person_add),
          title: const Text("Invite Friends"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Settings"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.help_outline),
          title: const Text("Telegram FAQ"),
          onTap: () {},
        ),
      ],
    ));
  }
}
