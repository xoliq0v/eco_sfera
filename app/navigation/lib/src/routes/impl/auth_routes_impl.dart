import 'package:auto_route/src/route/page_route_info.dart';
import 'package:feature_home/feature_home.dart';
import '../auth_routes.dart';

class AuthRoutesImpl extends AuthRoutes {
  @override
  PageRouteInfo getAuthRouter() {
    return const AuthRoute();
  }

  @override
  PageRouteInfo getChooseLangRoute() {
    return const ChooseLanguageRoute();
  }
}