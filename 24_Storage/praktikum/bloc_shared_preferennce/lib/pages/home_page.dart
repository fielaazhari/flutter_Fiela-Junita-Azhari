import 'package:bloc_shared_preferennce/bloc/user_bloc.dart';
import 'package:bloc_shared_preferennce/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  late SharedPreferences registerdata;
  String username = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    final userProvider = BlocProvider.of<UserBloc>(context);
    userProvider.add(Initial());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home '),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserChanged) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello, ${state.username}',
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      state.email,
                      style: const TextStyle(fontSize: 30),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        userProvider.add(AddBool(newUser: true));
                        userProvider.add(RemoveName());
                        userProvider.add(RemoveEmail());
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text('Sign Out'),
                    )
                  ],
                );
              }
              return const Text('Something when wrong');
            },
          ),
        ),
      ),
    );
  }
}
