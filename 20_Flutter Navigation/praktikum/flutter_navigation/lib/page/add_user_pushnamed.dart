import 'package:contact/models/user.dart';
import 'package:flutter/material.dart';

class AddUserPushnamed extends StatelessWidget {
  AddUserPushnamed({super.key});

  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addContact =
        ModalRoute.of(context)!.settings.arguments as Function(User);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Contact'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: TextField(
              controller: _name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter Name'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: TextField(
              controller: _phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter Phone'),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              final user = User(_name.text, _phone.text);

              addContact(user);
              Navigator.of(context).pop();
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}
