// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:core/core.dart' as _i26;
import 'package:feature_home/src/pages/auth/auth_screen.dart' as _i3;
import 'package:feature_home/src/pages/auth/page/boarding_screen.dart' as _i4;
import 'package:feature_home/src/pages/auth/page/choose_language.dart' as _i7;
import 'package:feature_home/src/pages/buy/buy_page.dart' as _i5;
import 'package:feature_home/src/pages/buy/page/add_customer_page.dart' as _i1;
import 'package:feature_home/src/pages/buy/page/payment_page.dart' as _i16;
import 'package:feature_home/src/pages/category_page/category_page.dart' as _i6;
import 'package:feature_home/src/pages/history/admissions_history_page.dart'
    as _i2;
import 'package:feature_home/src/pages/history/history_page.dart' as _i8;
import 'package:feature_home/src/pages/home/presentation/home_screen.dart'
    as _i9;
import 'package:feature_home/src/pages/main/main_page.dart' as _i10;
import 'package:feature_home/src/pages/orders/presentation/orders_page.dart'
    as _i14;
import 'package:feature_home/src/pages/partners/presentation/partners_page.dart'
    as _i15;
import 'package:feature_home/src/pages/polygon/polygon_screen.dart' as _i17;
import 'package:feature_home/src/pages/profile/presentation/page/mobile/my_account_page.dart'
    as _i12;
import 'package:feature_home/src/pages/profile/presentation/page/mobile/settings_page.dart'
    as _i21;
import 'package:feature_home/src/pages/profile/presentation/profile_page.dart'
    as _i18;
import 'package:feature_home/src/pages/reports/report_screen.dart' as _i19;
import 'package:feature_home/src/pages/road_map/page/mobile/map_route_page.dart'
    as _i11;
import 'package:feature_home/src/pages/road_map/page/mobile/order_card_page.dart'
    as _i13;
import 'package:feature_home/src/pages/road_map/page/mobile/signature_page.dart'
    as _i22;
import 'package:feature_home/src/pages/road_map/road_map_screen.dart' as _i20;
import 'package:feature_home/src/splash_page.dart' as _i23;
import 'package:flutter/material.dart' as _i25;

abstract class $FeatureHomeModule extends _i24.AutoRouterModule {
  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    AddCustomerRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.WrappedRoute(child: const _i1.AddCustomerPage()),
      );
    },
    AdmissionsHistoryRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.WrappedRoute(child: const _i2.AdmissionsHistoryPage()),
      );
    },
    AuthRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.WrappedRoute(child: const _i3.AuthScreen()),
      );
    },
    BoardingRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.BoardingScreen(),
      );
    },
    BuyRoute.name: (routeData) {
      final args =
          routeData.argsAs<BuyRouteArgs>(orElse: () => const BuyRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.WrappedRoute(
            child: _i5.BuyPage(
          key: args.key,
          param: args.param,
        )),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CategoryPage(),
      );
    },
    ChooseLanguageRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ChooseLanguagePage(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HistoryPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.WrappedRoute(
            child: _i10.MainPage(
          key: args.key,
          pages: args.pages,
          icons: args.icons,
          routes: args.routes,
        )),
      );
    },
    MapRouteRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MapRoutePage(),
      );
    },
    MyAccountRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.MyAccountPage(),
      );
    },
    OrderCardRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.OrderCardPage(),
      );
    },
    OrdersRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.WrappedRoute(child: const _i14.OrdersPage()),
      );
    },
    PartnersRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.WrappedRoute(child: const _i15.PartnersPage()),
      );
    },
    PaymentRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PaymentPage(),
      );
    },
    PolygonRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.PolygonScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.WrappedRoute(child: const _i18.ProfilePage()),
      );
    },
    ReportRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.ReportScreen(),
      );
    },
    RoadMapRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.RoadMapPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SettingsPage(),
      );
    },
    SignatureRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.SignaturePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.WrappedRoute(child: const _i23.SplashScreen()),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCustomerPage]
class AddCustomerRoute extends _i24.PageRouteInfo<void> {
  const AddCustomerRoute({List<_i24.PageRouteInfo>? children})
      : super(
          AddCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCustomerRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AdmissionsHistoryPage]
class AdmissionsHistoryRoute extends _i24.PageRouteInfo<void> {
  const AdmissionsHistoryRoute({List<_i24.PageRouteInfo>? children})
      : super(
          AdmissionsHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdmissionsHistoryRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AuthScreen]
class AuthRoute extends _i24.PageRouteInfo<void> {
  const AuthRoute({List<_i24.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BoardingScreen]
class BoardingRoute extends _i24.PageRouteInfo<void> {
  const BoardingRoute({List<_i24.PageRouteInfo>? children})
      : super(
          BoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BoardingRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i5.BuyPage]
class BuyRoute extends _i24.PageRouteInfo<BuyRouteArgs> {
  BuyRoute({
    _i25.Key? key,
    Map<String, int>? param,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          BuyRoute.name,
          args: BuyRouteArgs(
            key: key,
            param: param,
          ),
          initialChildren: children,
        );

  static const String name = 'BuyRoute';

  static const _i24.PageInfo<BuyRouteArgs> page =
      _i24.PageInfo<BuyRouteArgs>(name);
}

class BuyRouteArgs {
  const BuyRouteArgs({
    this.key,
    this.param,
  });

  final _i25.Key? key;

  final Map<String, int>? param;

  @override
  String toString() {
    return 'BuyRouteArgs{key: $key, param: $param}';
  }
}

/// generated route for
/// [_i6.CategoryPage]
class CategoryRoute extends _i24.PageRouteInfo<void> {
  const CategoryRoute({List<_i24.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ChooseLanguagePage]
class ChooseLanguageRoute extends _i24.PageRouteInfo<void> {
  const ChooseLanguageRoute({List<_i24.PageRouteInfo>? children})
      : super(
          ChooseLanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguageRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HistoryPage]
class HistoryRoute extends _i24.PageRouteInfo<void> {
  const HistoryRoute({List<_i24.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute({List<_i24.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MainPage]
class MainRoute extends _i24.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i25.Key? key,
    required List<_i26.PageRouteInfo<dynamic>> pages,
    required List<String> icons,
    required List<String> routes,
    List<_i24.PageRouteInfo>? children,
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

  static const _i24.PageInfo<MainRouteArgs> page =
      _i24.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.pages,
    required this.icons,
    required this.routes,
  });

  final _i25.Key? key;

  final List<_i26.PageRouteInfo<dynamic>> pages;

  final List<String> icons;

  final List<String> routes;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, pages: $pages, icons: $icons, routes: $routes}';
  }
}

/// generated route for
/// [_i11.MapRoutePage]
class MapRouteRoute extends _i24.PageRouteInfo<void> {
  const MapRouteRoute({List<_i24.PageRouteInfo>? children})
      : super(
          MapRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRouteRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i12.MyAccountPage]
class MyAccountRoute extends _i24.PageRouteInfo<void> {
  const MyAccountRoute({List<_i24.PageRouteInfo>? children})
      : super(
          MyAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAccountRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OrderCardPage]
class OrderCardRoute extends _i24.PageRouteInfo<void> {
  const OrderCardRoute({List<_i24.PageRouteInfo>? children})
      : super(
          OrderCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderCardRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i14.OrdersPage]
class OrdersRoute extends _i24.PageRouteInfo<void> {
  const OrdersRoute({List<_i24.PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PartnersPage]
class PartnersRoute extends _i24.PageRouteInfo<void> {
  const PartnersRoute({List<_i24.PageRouteInfo>? children})
      : super(
          PartnersRoute.name,
          initialChildren: children,
        );

  static const String name = 'PartnersRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PaymentPage]
class PaymentRoute extends _i24.PageRouteInfo<void> {
  const PaymentRoute({List<_i24.PageRouteInfo>? children})
      : super(
          PaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i17.PolygonScreen]
class PolygonRoute extends _i24.PageRouteInfo<void> {
  const PolygonRoute({List<_i24.PageRouteInfo>? children})
      : super(
          PolygonRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolygonRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ProfilePage]
class ProfileRoute extends _i24.PageRouteInfo<void> {
  const ProfileRoute({List<_i24.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ReportScreen]
class ReportRoute extends _i24.PageRouteInfo<void> {
  const ReportRoute({List<_i24.PageRouteInfo>? children})
      : super(
          ReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i20.RoadMapPage]
class RoadMapRoute extends _i24.PageRouteInfo<void> {
  const RoadMapRoute({List<_i24.PageRouteInfo>? children})
      : super(
          RoadMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoadMapRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SettingsPage]
class SettingsRoute extends _i24.PageRouteInfo<void> {
  const SettingsRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i22.SignaturePage]
class SignatureRoute extends _i24.PageRouteInfo<void> {
  const SignatureRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SignatureRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignatureRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SplashScreen]
class SplashRoute extends _i24.PageRouteInfo<void> {
  const SplashRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}
