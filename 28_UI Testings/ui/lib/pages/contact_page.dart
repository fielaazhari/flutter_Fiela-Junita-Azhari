import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/contact/contact_bloc.dart';
import 'package:state_management/components/task_item.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.read<ContactBloc>().add(LoadContact());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactLoading) {
            return const CircularProgressIndicator();
          } else if (state is ContactLoaded) {
            return ListView.separated(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    TaskItem(states: state.items[index]),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
            );
          }
          return const Text('Something went wrong');
        },
      ),
    );
  }
}
