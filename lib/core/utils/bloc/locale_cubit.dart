import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en'));

  Future<void> loadLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString('languageCode') ?? 'en';
      emit(Locale(languageCode));
    } catch (e) {
      log('Error loading locale: $e');
      // Fallback to default locale
      emit(const Locale('en'));
    }
  }

  Future<void> changeLocale(String languageCode) async {
    final newLocale = Locale(languageCode);
    emit(newLocale);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('languageCode', languageCode);
    } catch (e) {
      log('Error saving locale: $e');
      // Handle the error (e.g., show a message to the user)
    }
  }

  Future<bool> testSharedPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('test_key', 'test_value');
      final testValue = prefs.getString('test_key');
      print('Test value: $testValue');
      return testValue == 'test_value';
    } catch (e) {
      print('SharedPreferences test failed: $e');
      return false;
    }
  }

  static Future<LocaleCubit> create() async {
    final cubit = LocaleCubit();
    await cubit.testSharedPreferences();
    await cubit.loadLocale();
    return cubit;
  }
}