// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  final contacts;
  final deleteContact;
  const ContactsPage(
      {Key? key, required this.contacts, required this.deleteContact})
      : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.contacts.length,
      itemBuilder: (context, index) {
        return buildContactItem(context, index);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 16,
        );
      },
    );
  }

  Widget buildContactItem(BuildContext context, int index) {
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
                  widget.contacts[index].name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  widget.contacts[index].phone,
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                widget.deleteContact(index);
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
