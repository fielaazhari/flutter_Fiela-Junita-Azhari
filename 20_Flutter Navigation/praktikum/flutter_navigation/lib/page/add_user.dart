import 'package:contact/models/user.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  final Function(User) addContact;
  const AddUser(this.addContact);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

              widget.addContact(user);
              Navigator.of(context).pop();
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}
