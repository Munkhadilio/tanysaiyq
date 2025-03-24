import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(Brightness.dark));

  void setThemeBrightness(Brightness brightness) {
    emit(ThemeState(brightness));
  }
}
