import 'package:core/core.dart';
import 'package:navigation/navigation.dart';
import 'package:navigation/src/navigation/auth_navigation.dart';

mixin NavigationUtils {
  static MainNavigation getMainNavigator() {
    return GetIt.I.get<MainNavigation>();
  }

  static AuthNavigation getAuthNavigator() {
    return GetIt.I.get<AuthNavigation>();
  }
}