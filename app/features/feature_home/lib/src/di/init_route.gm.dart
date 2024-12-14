// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:core/core.dart' as _i25;
import 'package:feature_home/src/pages/auth/auth_screen.dart' as _i2;
import 'package:feature_home/src/pages/auth/page/boarding_screen.dart' as _i3;
import 'package:feature_home/src/pages/auth/page/choose_language.dart' as _i6;
import 'package:feature_home/src/pages/buy/buy_page.dart' as _i4;
import 'package:feature_home/src/pages/buy/page/payment_page.dart' as _i15;
import 'package:feature_home/src/pages/category_page/category_page.dart' as _i5;
import 'package:feature_home/src/pages/history/admissions_history_page.dart'
    as _i1;
import 'package:feature_home/src/pages/history/history_page.dart' as _i7;
import 'package:feature_home/src/pages/home/presentation/home_screen.dart'
    as _i8;
import 'package:feature_home/src/pages/main/main_page.dart' as _i9;
import 'package:feature_home/src/pages/orders/presentation/orders_page.dart'
    as _i13;
import 'package:feature_home/src/pages/partners/presentation/partners_page.dart'
    as _i14;
import 'package:feature_home/src/pages/polygon/polygon_screen.dart' as _i16;
import 'package:feature_home/src/pages/profile/presentation/page/mobile/my_account_page.dart'
    as _i11;
import 'package:feature_home/src/pages/profile/presentation/page/mobile/settings_page.dart'
    as _i20;
import 'package:feature_home/src/pages/profile/presentation/profile_page.dart'
    as _i17;
import 'package:feature_home/src/pages/reports/report_screen.dart' as _i18;
import 'package:feature_home/src/pages/road_map/page/mobile/map_route_page.dart'
    as _i10;
import 'package:feature_home/src/pages/road_map/page/mobile/order_card_page.dart'
    as _i12;
import 'package:feature_home/src/pages/road_map/page/mobile/signature_page.dart'
    as _i21;
import 'package:feature_home/src/pages/road_map/road_map_screen.dart' as _i19;
import 'package:feature_home/src/splash_page.dart' as _i22;
import 'package:flutter/material.dart' as _i24;

abstract class $FeatureHomeModule extends _i23.AutoRouterModule {
  @override
  final Map<String, _i23.PageFactory> pagesMap = {
    AdmissionsHistoryRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdmissionsHistoryPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.WrappedRoute(child: const _i2.AuthScreen()),
      );
    },
    BoardingRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BoardingScreen(),
      );
    },
    BuyRoute.name: (routeData) {
      final args =
          routeData.argsAs<BuyRouteArgs>(orElse: () => const BuyRouteArgs());
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.BuyPage(
          key: args.key,
          name: args.name,
        ),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CategoryPage(),
      );
    },
    ChooseLanguageRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ChooseLanguagePage(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HistoryPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.WrappedRoute(
            child: _i9.MainPage(
          key: args.key,
          pages: args.pages,
          icons: args.icons,
          routes: args.routes,
        )),
      );
    },
    MapRouteRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MapRoutePage(),
      );
    },
    MyAccountRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MyAccountPage(),
      );
    },
    OrderCardRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.OrderCardPage(),
      );
    },
    OrdersRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.WrappedRoute(child: const _i13.OrdersPage()),
      );
    },
    PartnersRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.WrappedRoute(child: const _i14.PartnersPage()),
      );
    },
    PaymentRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PaymentPage(),
      );
    },
    PolygonRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PolygonScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.WrappedRoute(child: const _i17.ProfilePage()),
      );
    },
    ReportRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ReportScreen(),
      );
    },
    RoadMapRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.RoadMapPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.SettingsPage(),
      );
    },
    SignatureRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SignaturePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.WrappedRoute(child: const _i22.SplashScreen()),
      );
    },
  };
}

/// generated route for
/// [_i1.AdmissionsHistoryPage]
class AdmissionsHistoryRoute extends _i23.PageRouteInfo<void> {
  const AdmissionsHistoryRoute({List<_i23.PageRouteInfo>? children})
      : super(
          AdmissionsHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdmissionsHistoryRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i23.PageRouteInfo<void> {
  const AuthRoute({List<_i23.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BoardingScreen]
class BoardingRoute extends _i23.PageRouteInfo<void> {
  const BoardingRoute({List<_i23.PageRouteInfo>? children})
      : super(
          BoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BoardingRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BuyPage]
class BuyRoute extends _i23.PageRouteInfo<BuyRouteArgs> {
  BuyRoute({
    _i24.Key? key,
    String? name,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          BuyRoute.name,
          args: BuyRouteArgs(
            key: key,
            name: name,
          ),
          initialChildren: children,
        );

  static const String name = 'BuyRoute';

  static const _i23.PageInfo<BuyRouteArgs> page =
      _i23.PageInfo<BuyRouteArgs>(name);
}

class BuyRouteArgs {
  const BuyRouteArgs({
    this.key,
    this.name,
  });

  final _i24.Key? key;

  final String? name;

  @override
  String toString() {
    return 'BuyRouteArgs{key: $key, name: $name}';
  }
}

/// generated route for
/// [_i5.CategoryPage]
class CategoryRoute extends _i23.PageRouteInfo<void> {
  const CategoryRoute({List<_i23.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ChooseLanguagePage]
class ChooseLanguageRoute extends _i23.PageRouteInfo<void> {
  const ChooseLanguageRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ChooseLanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguageRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HistoryPage]
class HistoryRoute extends _i23.PageRouteInfo<void> {
  const HistoryRoute({List<_i23.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i23.PageRouteInfo<void> {
  const HomeRoute({List<_i23.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MainPage]
class MainRoute extends _i23.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i24.Key? key,
    required List<_i25.PageRouteInfo<dynamic>> pages,
    required List<String> icons,
    required List<String> routes,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            pages: pages,
            icons: icons,
            routes: routes,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i23.PageInfo<MainRouteArgs> page =
      _i23.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.pages,
    required this.icons,
    required this.routes,
  });

  final _i24.Key? key;

  final List<_i25.PageRouteInfo<dynamic>> pages;

  final List<String> icons;

  final List<String> routes;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, pages: $pages, icons: $icons, routes: $routes}';
  }
}

/// generated route for
/// [_i10.MapRoutePage]
class MapRouteRoute extends _i23.PageRouteInfo<void> {
  const MapRouteRoute({List<_i23.PageRouteInfo>? children})
      : super(
          MapRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRouteRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MyAccountPage]
class MyAccountRoute extends _i23.PageRouteInfo<void> {
  const MyAccountRoute({List<_i23.PageRouteInfo>? children})
      : super(
          MyAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAccountRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i12.OrderCardPage]
class OrderCardRoute extends _i23.PageRouteInfo<void> {
  const OrderCardRoute({List<_i23.PageRouteInfo>? children})
      : super(
          OrderCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderCardRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OrdersPage]
class OrdersRoute extends _i23.PageRouteInfo<void> {
  const OrdersRoute({List<_i23.PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i14.PartnersPage]
class PartnersRoute extends _i23.PageRouteInfo<void> {
  const PartnersRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PartnersRoute.name,
          initialChildren: children,
        );

  static const String name = 'PartnersRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PaymentPage]
class PaymentRoute extends _i23.PageRouteInfo<void> {
  const PaymentRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PolygonScreen]
class PolygonRoute extends _i23.PageRouteInfo<void> {
  const PolygonRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PolygonRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolygonRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ProfilePage]
class ProfileRoute extends _i23.PageRouteInfo<void> {
  const ProfileRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ReportScreen]
class ReportRoute extends _i23.PageRouteInfo<void> {
  const ReportRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i19.RoadMapPage]
class RoadMapRoute extends _i23.PageRouteInfo<void> {
  const RoadMapRoute({List<_i23.PageRouteInfo>? children})
      : super(
          RoadMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoadMapRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i20.SettingsPage]
class SettingsRoute extends _i23.PageRouteInfo<void> {
  const SettingsRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SignaturePage]
class SignatureRoute extends _i23.PageRouteInfo<void> {
  const SignatureRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SignatureRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignatureRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i22.SplashScreen]
class SplashRoute extends _i23.PageRouteInfo<void> {
  const SplashRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}
