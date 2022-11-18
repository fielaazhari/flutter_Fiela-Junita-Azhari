import 'package:bloc/bloc.dart';
import 'package:bloc_shared_preferennce/pages/home_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserChanged()) {
    late SharedPreferences registerdata;
    late bool newUser;
    bool toogle = true;
    String username = '';
    String email = '';

    on<CheckUser>(
      (event, emit) async {
        if (state is UserChanged) {
          // final state = this.state as UserChanged;
          registerdata = await SharedPreferences.getInstance();
          newUser = registerdata.getBool('register') ?? true;
          if (newUser == false) {
            Navigator.pushAndRemoveUntil(
                event.context!,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
                (route) => false);
          }
          // print('Check User');
        }
      },
    );

    on<Initial>(
      (event, emit) async {
        if (state is UserChanged) {
          registerdata = await SharedPreferences.getInstance();
          username = registerdata.getString('username').toString();
          email = registerdata.getString('email').toString();
          emit(UserChanged(username: username, email: email));
        }
      },
    );

    on<AddBool>(
      (event, emit) async {
        if (state is UserChanged) {
          registerdata = await SharedPreferences.getInstance();
          registerdata.setBool('register', event.newUser);
        }
      },
    );

    on<AddName>(
      (event, emit) async {
        if (state is UserChanged) {
          registerdata = await SharedPreferences.getInstance();
          registerdata.setString('username', event.username);
          print('Name Changed ${event.username}');
        }
      },
    );

    on<AddEmail>(
      (event, emit) async {
        if (state is UserChanged) {
          registerdata = await SharedPreferences.getInstance();
          registerdata.setString('email', event.email);
          print('Email Changed ${event.email}');
        }
      },
    );

    on<RemoveName>(
      (event, emit) async {
        if (state is UserChanged) {
          registerdata = await SharedPreferences.getInstance();
          registerdata.remove('username');
          print('Name Deleted');
        }
      },
    );

    on<RemoveEmail>(
      (event, emit) async {
        if (state is UserChanged) {
          registerdata = await SharedPreferences.getInstance();
          registerdata.remove('email');
          print('Email Deleted');
        }
      },
    );

    on<ChangeUser>(
      (event, emit) {
        if (state is UserChanged) {
          final state = this.state as UserChanged;
          emit(UserChanged(toogle: toogle = !toogle));
        }
      },
    );
  }
}
