// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class LoadContact extends ContactEvent {
  List<ContactModel> items;
  LoadContact({this.items = const <ContactModel>[]});
  @override
  List<Object> get props => [items];
}

class AddContact extends ContactEvent {
  ContactModel contact;
  AddContact({
    required this.contact,
  });

  @override
  List<Object> get props => [contact];
}

class RemoveContact extends ContactEvent {
  final ContactModel contact;
  const RemoveContact({
    required this.contact,
  });
}

class CheckContact extends ContactEvent {
  List<ContactModel> items;
  CheckContact({this.items = const <ContactModel>[]});
  @override
  List<Object> get props => [items];
}
