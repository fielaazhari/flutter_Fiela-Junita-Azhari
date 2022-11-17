// import 'package:contacts/models/m_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/contact/contact_bloc.dart';
import 'package:state_management/models/m_contacts.dart';
// import 'package:provider/provider.dart';
// import 'package:uuid/uuid.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({
    Key? key,
    // required this.onCreate,
  }) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  // final Function(ContactModel) onCreate;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final contactProvider = Provider.of<Contact>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                      setState(() {
                        formKey.currentState!.validate();
                      });
                      if (nameController.text.isEmpty ||
                          phoneController.text.isEmpty) {
                        return;
                      }
                      final contactItem = ContactModel(
                        name: nameController.text,
                        phone: phoneController.text,
                      );
                      context
                          .read<ContactBloc>()
                          .add(AddContact(contact: contactItem));

                      Navigator.pop(context);
                    },
                    child: const Text('CREATE CONTACT'))
              ],
            ),
          )),
    );
  }
}
