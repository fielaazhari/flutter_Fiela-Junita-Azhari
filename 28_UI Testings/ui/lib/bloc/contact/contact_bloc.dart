import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:state_management/models/m_contacts.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactLoading()) {
    on<LoadContact>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(
        ContactLoaded(
          items: const [ContactModel(name: 'Rayhan', phone: '082222213123')],
        ),
      );
    });
    on<AddContact>(
      (event, emit) {
        final state = this.state;
        if (state is ContactLoaded) {
          emit(
              ContactLoaded(items: List.from(state.items)..add(event.contact)));
        }
      },
    );
    on<RemoveContact>(
      (event, emit) {
        if (state is ContactLoaded) {
          final state = this.state as ContactLoaded;
          emit(ContactLoaded(
              items: List.from(state.items)..remove(event.contact)));
        }
      },
    );
    on<CheckContact>(
      (event, emit) {
        if (state is ContactLoaded) {
          final state = this.state as ContactLoaded;

          if (state.items.isEmpty) {
            emit(
              ContactLoaded(isEmpty: true, items: List.from(state.items)),
            );
          } else {
            emit(
              ContactLoaded(isEmpty: false, items: List.from(state.items)),
            );
          }
        }
      },
    );
  }
}
