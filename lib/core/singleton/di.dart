import 'package:get_it/get_it.dart';

import '../constants/route/app_router.dart';
import '../utils/bloc/theme_cubit.dart';


final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton(() => AppRouter());
  getIt.registerLazySingleton(() => ThemeCubit());
}
