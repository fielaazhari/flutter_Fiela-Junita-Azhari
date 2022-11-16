import 'package:contact/page/add_user.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<User> userList = [
    User('Fiela', '0811911170611'),
    User('Junita', '0811911170612'),
    User('Azhari', '0811911170613'),
    User('Fajar', '0811911170614'),
    User('Syukur', '0811911170615'),
  ];

  // void showUserDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (_) {
  //         return AlertDialog(
  //           content: AddContact(addContact),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //         );
  //       });
  // }

  // void showUsers() {
  //   showDialog(
  //       context: context,
  //       builder: (_) {
  //         return AddUser(addContact);
  //       });
  // }

  void addContact(User user) {
    setState(() {
      userList.add(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: userList.length,
          itemBuilder: ((context, index) {
            return Container(
              margin: const EdgeInsets.all(6),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: Center(
                      child: Text(
                        userList[index].name[0].toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userList[index].name),
                        const SizedBox(height: 3),
                        Text(
                          userList[index].phone,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.4)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: showUserDialog,
        //   child: const Icon(Icons.add),
        // ),
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Navigation Push',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddUser(addContact)));
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Navigation Pushnamed',
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/adduser', arguments: addContact);
              },
            ),
          ],
        ));
  }
}
