// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends ThemeEvent {
  final ThemeData theme;
  const ChangeTheme({
    required this.theme,
  });

  @override
  List<Object> get props => [theme];
}
