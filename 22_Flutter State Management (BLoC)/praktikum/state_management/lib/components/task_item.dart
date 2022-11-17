// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/contact/contact_bloc.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    Key? key,
    required this.states,
  }) : super(key: key);
  final states;

  @override
  Widget build(BuildContext context) {
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
                  states.name,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  states.phone,
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                context.read<ContactBloc>().add(RemoveContact(contact: states));
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
