import 'package:core/core.dart';
import '../navigation.dart';
import 'navigation/auth_navigation.dart';

mixin NavigationUtils {
  static MainNavigation getMainNavigator() {
    return GetIt.I.get<MainNavigation>();
  }

  static AuthNavigation getAuthNavigator() {
    return GetIt.I.get<AuthNavigation>();
  }
}
