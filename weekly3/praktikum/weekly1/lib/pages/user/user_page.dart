import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly1/components/contact_item.dart';
import 'package:weekly1/pages/empty/empty_page.dart';
import 'package:weekly1/pages/home/home_view_model.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data User'),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, value, child) {
          if (value.users.isEmpty) {
            return const EmptyPage();
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              itemCount: prov.users.length,
              itemBuilder: (context, index) {
                final user = prov.users[index];
                return ContactItem(index: index);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
