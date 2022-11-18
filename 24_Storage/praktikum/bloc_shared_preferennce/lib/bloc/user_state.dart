// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserChanged extends UserState {
  String username;
  String email;
  bool toogle;
  UserChanged({
    this.username = '',
    this.email = '',
    this.toogle = true,
  });

  @override
  List<Object> get props => [username, email, toogle];
}
