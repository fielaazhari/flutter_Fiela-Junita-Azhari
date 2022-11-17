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
  bool isEmpty;

  ContactLoaded({
    required this.items,
    this.isEmpty = true,
  });
  @override
  List<Object> get props => [items, isEmpty];
}
