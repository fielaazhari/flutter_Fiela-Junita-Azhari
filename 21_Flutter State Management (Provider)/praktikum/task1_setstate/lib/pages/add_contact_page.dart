import 'package:contacts/models/m_contacts.dart';
import 'package:flutter/material.dart';



class AddContactPage extends StatefulWidget {
  final Function(ContactModel) addContact;
  const AddContactPage({
    Key? key,
    required this.addContact,
  }) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final Map<String, dynamic> contact = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(0.2),
                labelText: 'Name',
                border: const UnderlineInputBorder(),
                filled: true,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Add Name Properly';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(0.2),
                labelText: 'Phone Number',
                border: const UnderlineInputBorder(),
                filled: true,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Add Phone Number Properly';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40)),
                onPressed: () {
                  contact.addAll({
                    'name': nameController.text,
                    'phone': phoneController.text
                  });
                  final contacts = ContactModel(
                      name: contact['name'], phone: contact['phone']);
                  widget.addContact(contacts);

                  Navigator.pop(context);
                },
                child: const Text('CREATE CONTACT'))
          ],
        ),
      )),
    );
  }
}
