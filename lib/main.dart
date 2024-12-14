import 'package:core/core.dart';
import 'package:firebase_eco/firebase_eco.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'di/injection.dart';
import 'package:app_bloc/app_bloc.dart';

import 'firebase_options.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Future.wait([
    configInjection(),
    EasyLocalization.ensureInitialized(),
  ]);

  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
