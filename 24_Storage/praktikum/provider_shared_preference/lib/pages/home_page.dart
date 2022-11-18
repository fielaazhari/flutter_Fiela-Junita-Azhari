import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shared_preference/pages/register_page.dart';
import 'package:provider_shared_preference/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  late SharedPreferences registerdata;
  String username = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    userProvider.initial();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home '),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  overflow: TextOverflow.ellipsis,
                  'Hello, ${value.username}',
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            Consumer<UserProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  overflow: TextOverflow.ellipsis,
                  value.email,
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  userProvider.addBool(true);
                  userProvider.deleteName(username);
                  userProvider.deleteEmail(email);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: const Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}
