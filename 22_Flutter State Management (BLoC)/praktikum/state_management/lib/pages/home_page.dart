import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:state_management/bloc/theme/theme_bloc.dart';
import 'package:state_management/models/m_theme.dart';
import 'package:state_management/pages/add_contact_page.dart';
import 'package:state_management/pages/contact_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Home'),
      ),
      body: buildHomePage(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SpeedDial(
            icon: Icons.add,
            children: [
              SpeedDialChild(
                child: const Icon(Icons.add),
                label: 'Add Contacts',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const AddContactPage();
                    },
                  ));
                },
              ),
              SpeedDialChild(
                  child: const Icon(Icons.palette),
                  label: 'Switch Theme',
                  onTap: () {
                    if (isDark) {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(ChangeTheme(theme: AppTheme.lightTheme));
                      isDark = false;
                    } else {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(ChangeTheme(theme: AppTheme.darkTheme));
                      isDark = true;
                    }
                  })
            ],
          )
        ],
      ),
    );
  }

  Widget buildHomePage() {
    return const ContactPage();
  }
}
