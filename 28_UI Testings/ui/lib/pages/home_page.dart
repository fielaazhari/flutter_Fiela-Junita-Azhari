import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:state_management/bloc/contact/contact_bloc.dart';
import 'package:state_management/bloc/theme/theme_bloc.dart';
import 'package:state_management/models/m_theme.dart';
import 'package:state_management/pages/add_contact_page.dart';
import 'package:state_management/pages/contact_page.dart';
import 'package:state_management/pages/empty_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeBloc tbloc = BlocProvider.of<ThemeBloc>(context);
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
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const AddContactPage();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final tween = Tween(begin: 0.0, end: 1.0);
                      return FadeTransition(
                        opacity: animation.drive(tween),
                        child: child,
                      );

                      // // Slide Transition
                      // final tween =
                      //     Tween(begin: const Offset(0, .5), end: Offset.zero);
                      // return SlideTransition(
                      //   position: animation.drive(tween),
                      //   child: child,
                      // );

                      // // Fade Transition
                      // final tween = Tween(begin: 0.0, end: 1.0);
                      // return FadeTransition(
                      //   opacity: animation.drive(tween),
                      //   child: child,
                      // );

                      // // Scale Transition
                      // final tween = Tween(begin: 0.0, end: 1.0);
                      // return ScaleTransition(
                      //   scale: animation.drive(tween),
                      //   child: child,
                      // );
                    },
                  ));
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.palette),
                label: 'Switch Theme Dark',
                onTap: () {
                  tbloc.add(ChangeTheme(theme: AppTheme.darkTheme));
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.palette),
                label: 'Switch Theme Light',
                onTap: () {
                  tbloc.add(ChangeTheme(theme: AppTheme.lightTheme));
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildHomePage() {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        BlocProvider.of<ContactBloc>(context).add(CheckContact());
        if (state is ContactLoading) {
          return const CircularProgressIndicator();
        } else if (state is ContactLoaded) {
          return state.isEmpty ? const EmptyPage() : const ContactPage();
        }
        return const Text('Something went wrong');
      },
    );
  }
}
