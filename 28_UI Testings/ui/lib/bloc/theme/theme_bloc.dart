import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:state_management/models/m_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: AppTheme.lightTheme)) {
    // Dijalankan setelah ThemeState
    on<ThemeEvent>((event, emit) {
      if (event is ChangeTheme) {
        emit.call(ThemeState(themeData: event.theme));
      }
    });
  }
}
