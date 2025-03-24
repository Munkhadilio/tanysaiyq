import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('ru')) {
    _loadLocale();
  }

  void _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString('locale') ?? 'ru';
    emit(Locale(localeCode));
  }

  void setLocale(String localeCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', localeCode);
    emit(Locale(localeCode));
  }
}
