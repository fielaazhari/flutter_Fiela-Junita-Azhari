import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import '../gen/assets.gen.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(faker.person.name()),
            accountEmail: Text(faker.internet.email()),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  Assets.images.profile.path,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Assets.images.drawerBackground.path),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.contact_support),
            title: const Text('Contact Us'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Log in'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
