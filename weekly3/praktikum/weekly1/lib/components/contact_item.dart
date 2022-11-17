// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home/home_view_model.dart';

class ContactItem extends StatelessWidget {
  int index;
  ContactItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<HomeViewModel>(context).users[index];
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${prov.name}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Email: ${prov.email}',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                        Text(
                          'Message: ${prov.message}',
                          style: TextStyle(
                              // overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Provider.of<HomeViewModel>(context, listen: false)
                          .deleteUser(
                        index,
                      );
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
