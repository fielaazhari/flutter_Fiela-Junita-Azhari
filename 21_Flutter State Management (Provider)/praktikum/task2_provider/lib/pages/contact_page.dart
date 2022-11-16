import 'package:contacts/models/m_contacts.dart';
import 'package:flutter/material.dart';
import 'package:contacts/models/contacs.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key? key,
    required this.contact,
  }) : super(key: key);
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final contactItems = contact.contacts;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: contactItems.length,
        itemBuilder: (context, index) {
          ContactModel item = contactItems[index];
          return buildContactItem(context, item, index);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
      ),
    );
  }

  Widget buildContactItem(BuildContext context, ContactModel item, int index) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person_pin,
              size: 40,
              color: Colors.grey[600],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  item.phone,
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                contact.deleteContact(
                  index,
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.grey[600],
              ))
        ],
      ),
    );
  }
}
