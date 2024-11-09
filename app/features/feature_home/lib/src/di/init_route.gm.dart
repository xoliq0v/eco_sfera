// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:core/core.dart' as _i24;
import 'package:feature_home/src/pages/main/main_page.dart' as _i9;
import 'package:feature_home/src/pages/auth/auth_screen.dart' as _i2;
import 'package:feature_home/src/pages/auth/page/boarding_screen.dart' as _i3;
import 'package:feature_home/src/pages/auth/page/choose_language.dart' as _i6;
import 'package:feature_home/src/pages/buy/buy_page.dart' as _i4;
import 'package:feature_home/src/pages/buy/page/payment_page.dart' as _i14;
import 'package:feature_home/src/pages/category_page/category_page.dart' as _i5;
import 'package:feature_home/src/pages/history/admissions_history_page.dart'
    as _i1;
import 'package:feature_home/src/pages/history/history_page.dart' as _i7;
import 'package:feature_home/src/pages/home/presentation/home_screen.dart'
    as _i8;
import 'package:feature_home/src/pages/orders/presentation/orders_page.dart'
    as _i13;
import 'package:feature_home/src/pages/polygon/polygon_screen.dart' as _i15;
import 'package:feature_home/src/pages/profile/presentation/page/mobile/my_account_page.dart'
    as _i11;
import 'package:feature_home/src/pages/profile/presentation/page/mobile/settings_page.dart'
    as _i19;
import 'package:feature_home/src/pages/profile/presentation/profile_page.dart'
    as _i16;
import 'package:feature_home/src/pages/reports/report_screen.dart' as _i17;
import 'package:feature_home/src/pages/road_map/page/mobile/map_route_page.dart'
    as _i10;
import 'package:feature_home/src/pages/road_map/page/mobile/order_card_page.dart'
    as _i12;
import 'package:feature_home/src/pages/road_map/page/mobile/signature_page.dart'
    as _i20;
import 'package:feature_home/src/pages/road_map/road_map_screen.dart' as _i18;
import 'package:feature_home/src/splash_page.dart' as _i21;
import 'package:flutter/material.dart' as _i23;

abstract class $FeatureHomeModule extends _i22.AutoRouterModule {
  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    AdmissionsHistoryRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdmissionsHistoryPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.WrappedRoute(child: const _i2.AuthScreen()),
      );
    },
    BoardingRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BoardingScreen(),
      );
    },
    BuyRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.BuyPage(),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CategoryPage(),
      );
    },
    ChooseLanguageRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ChooseLanguagePage(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HistoryPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.WrappedRoute(
            child: _i9.MainPage(
          key: args.key,
          pages: args.pages,
          icons: args.icons,
          routes: args.routes,
        )),
      );
    },
    MapRouteRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MapRoutePage(),
      );
    },
    MyAccountRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MyAccountPage(),
      );
    },
    OrderCardRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.OrderCardPage(),
      );
    },
    OrdersRoute.name: (routeData) {
      final args = routeData.argsAs<OrdersRouteArgs>(
          orElse: () => const OrdersRouteArgs());
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.OrdersPage(key: args.key),
      );
    },
    PaymentRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.PaymentPage(),
      );
    },
    PolygonRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PolygonScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ProfilePage(),
      );
    },
    ReportRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.ReportScreen(),
      );
    },
    RoadMapRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.RoadMapPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.SettingsPage(),
      );
    },
    SignatureRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.SignaturePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.WrappedRoute(child: const _i21.SplashScreen()),
      );
    },
  };
}

/// generated route for
/// [_i1.AdmissionsHistoryPage]
class AdmissionsHistoryRoute extends _i22.PageRouteInfo<void> {
  const AdmissionsHistoryRoute({List<_i22.PageRouteInfo>? children})
      : super(
          AdmissionsHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdmissionsHistoryRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i22.PageRouteInfo<void> {
  const AuthRoute({List<_i22.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BoardingScreen]
class BoardingRoute extends _i22.PageRouteInfo<void> {
  const BoardingRoute({List<_i22.PageRouteInfo>? children})
      : super(
          BoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BoardingRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BuyPage]
class BuyRoute extends _i22.PageRouteInfo<void> {
  const BuyRoute({List<_i22.PageRouteInfo>? children})
      : super(
          BuyRoute.name,
          initialChildren: children,
        );

  static const String name = 'BuyRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CategoryPage]
class CategoryRoute extends _i22.PageRouteInfo<void> {
  const CategoryRoute({List<_i22.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ChooseLanguageScreen]
class ChooseLanguageRoute extends _i22.PageRouteInfo<void> {
  const ChooseLanguageRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ChooseLanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguageRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HistoryPage]
class HistoryRoute extends _i22.PageRouteInfo<void> {
  const HistoryRoute({List<_i22.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i22.PageRouteInfo<void> {
  const HomeRoute({List<_i22.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MainPage]
class MainRoute extends _i22.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i23.Key? key,
    required List<_i24.PageRouteInfo<dynamic>> pages,
    required List<String> icons,
    required List<String> routes,
    List<_i22.PageRouteInfo>? children,
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

  static const _i22.PageInfo<MainRouteArgs> page =
      _i22.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.pages,
    required this.icons,
    required this.routes,
  });

  final _i23.Key? key;

  final List<_i24.PageRouteInfo<dynamic>> pages;

  final List<String> icons;

  final List<String> routes;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, pages: $pages, icons: $icons, routes: $routes}';
  }
}

/// generated route for
/// [_i10.MapRoutePage]
class MapRouteRoute extends _i22.PageRouteInfo<void> {
  const MapRouteRoute({List<_i22.PageRouteInfo>? children})
      : super(
          MapRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRouteRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MyAccountPage]
class MyAccountRoute extends _i22.PageRouteInfo<void> {
  const MyAccountRoute({List<_i22.PageRouteInfo>? children})
      : super(
          MyAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAccountRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i12.OrderCardPage]
class OrderCardRoute extends _i22.PageRouteInfo<void> {
  const OrderCardRoute({List<_i22.PageRouteInfo>? children})
      : super(
          OrderCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderCardRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OrdersPage]
class OrdersRoute extends _i22.PageRouteInfo<OrdersRouteArgs> {
  OrdersRoute({
    _i23.Key? key,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          OrdersRoute.name,
          args: OrdersRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const _i22.PageInfo<OrdersRouteArgs> page =
      _i22.PageInfo<OrdersRouteArgs>(name);
}

class OrdersRouteArgs {
  const OrdersRouteArgs({this.key});

  final _i23.Key? key;

  @override
  String toString() {
    return 'OrdersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.PaymentPage]
class PaymentRoute extends _i22.PageRouteInfo<void> {
  const PaymentRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PolygonScreen]
class PolygonRoute extends _i22.PageRouteInfo<void> {
  const PolygonRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PolygonRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolygonRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ProfilePage]
class ProfileRoute extends _i22.PageRouteInfo<void> {
  const ProfileRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ReportScreen]
class ReportRoute extends _i22.PageRouteInfo<void> {
  const ReportRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i18.RoadMapScreen]
class RoadMapRoute extends _i22.PageRouteInfo<void> {
  const RoadMapRoute({List<_i22.PageRouteInfo>? children})
      : super(
          RoadMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoadMapRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SettingsPage]
class SettingsRoute extends _i22.PageRouteInfo<void> {
  const SettingsRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i20.SignaturePage]
class SignatureRoute extends _i22.PageRouteInfo<void> {
  const SignatureRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SignatureRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignatureRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SplashScreen]
class SplashRoute extends _i22.PageRouteInfo<void> {
  const SplashRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}
