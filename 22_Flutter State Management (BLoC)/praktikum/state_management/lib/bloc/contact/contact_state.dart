// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactLoading extends ContactState {}

class ContactLoaded extends ContactState {
  List<ContactModel> items;

  ContactLoaded({this.items = const <ContactModel>[]});
  @override
  List<Object> get props => [items];
}
