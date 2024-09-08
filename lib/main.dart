import 'dart:developer';

import 'package:flutter/material.dart';

import 'app.dart';
import 'core/singleton/di.dart';
import 'core/utils/bloc/locale_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  final localeCubit = await LocaleCubit.create();

  bool sharedPrefsWorking = await localeCubit.testSharedPreferences();
  log('SharedPreferences working: $sharedPrefsWorking');

  runApp(App(localeCubit: localeCubit));
}
