import 'package:contacts/models/m_contacts.dart';
import 'package:contacts/pages/add_contact_page.dart';
import 'package:contacts/pages/contacts_page.dart';
import 'package:contacts/pages/empty_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContactModel> contacts = [];

  void addContact(ContactModel contact) {
    setState(() {
      contacts.add(contact);
    });
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Contact State Management'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddContactPage(addContact: addContact),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: contacts.isNotEmpty
            ? ContactsPage(
                contacts: contacts,
                deleteContact: deleteContact,
              )
            : const EmptyPage(),
      ),
    );
  }
}
