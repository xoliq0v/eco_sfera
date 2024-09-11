import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../constants/route/app_router.dart';
import '../utils/bloc/theme_cubit.dart';


final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void init() {
  getIt.registerLazySingleton(() => AppRouter());
  getIt.registerLazySingleton(() => ThemeCubit());
}
