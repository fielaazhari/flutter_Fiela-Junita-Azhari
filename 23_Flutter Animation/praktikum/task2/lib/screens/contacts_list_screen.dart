import 'package:flutter/material.dart';
import 'package:task2/moduls/contacts_model.dart';
import 'package:task2/screens/add_contact_screen.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: contacts.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.group),
                  Text('Your Contact Is Empty'),
                ],
              )
            : ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10, left: 10),
                  child: Card(
                    elevation: 5,
                    color: Colors.blue[100],
                    child: ListTile(
                      title: Text(contacts[index].name),
                      subtitle: Text(contacts[index].phonenumber),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.person),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          contacts.removeAt(index);
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return const AddContactScreen();
              },
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final tween =
                    Tween(begin: const Offset(0, .5), end: Offset.zero);
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
          contacts.add(result);
          setState(() {});
        },
        child: const Icon(Icons.person_add_alt_1),
      ),
    );
  }
}
