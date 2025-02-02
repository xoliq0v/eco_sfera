// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i31;
import 'package:core/core.dart' as _i34;
import 'package:feature_home/src/pages/auth/auth_screen.dart' as _i5;
import 'package:feature_home/src/pages/auth/page/boarding_screen.dart' as _i6;
import 'package:feature_home/src/pages/auth/page/choose_language.dart' as _i9;
import 'package:feature_home/src/pages/buy/buy_page.dart' as _i7;
import 'package:feature_home/src/pages/buy/page/add_customer_page.dart' as _i3;
import 'package:feature_home/src/pages/buy/page/payment_page.dart' as _i19;
import 'package:feature_home/src/pages/buy/page/payment_with_card_page.dart'
    as _i20;
import 'package:feature_home/src/pages/category_page/category_page.dart' as _i8;
import 'package:feature_home/src/pages/history/admissions_history_page.dart'
    as _i1;
import 'package:feature_home/src/pages/history/history_page.dart' as _i11;
import 'package:feature_home/src/pages/history/page/complete_partner_order.dart'
    as _i10;
import 'package:feature_home/src/pages/home/presentation/home_screen.dart'
    as _i12;
import 'package:feature_home/src/pages/info/presentation/page/add_comment_page.dart'
    as _i2;
import 'package:feature_home/src/pages/info/presentation/page/price_changer_page.dart'
    as _i23;
import 'package:feature_home/src/pages/info/presentation/presentation.dart'
    as _i22;
import 'package:feature_home/src/pages/main/main_page.dart' as _i13;
import 'package:feature_home/src/pages/orders/presentation/orders_page.dart'
    as _i17;
import 'package:feature_home/src/pages/partners/presentation/page/mobile/submission_page.dart'
    as _i30;
import 'package:feature_home/src/pages/partners/presentation/partners_page.dart'
    as _i18;
import 'package:feature_home/src/pages/polygon/polygon_screen.dart' as _i21;
import 'package:feature_home/src/pages/profile/presentation/page/mobile/announcement_page.dart'
    as _i4;
import 'package:feature_home/src/pages/profile/presentation/page/mobile/my_account_page.dart'
    as _i15;
import 'package:feature_home/src/pages/profile/presentation/page/mobile/settings_page.dart'
    as _i27;
import 'package:feature_home/src/pages/profile/presentation/profile_page.dart'
    as _i24;
import 'package:feature_home/src/pages/reports/report_screen.dart' as _i25;
import 'package:feature_home/src/pages/road_map/page/mobile/map_route_page.dart'
    as _i14;
import 'package:feature_home/src/pages/road_map/page/mobile/order_card_page.dart'
    as _i16;
import 'package:feature_home/src/pages/road_map/page/mobile/signature_page.dart'
    as _i28;
import 'package:feature_home/src/pages/road_map/road_map_screen.dart' as _i26;
import 'package:feature_home/src/splash_page.dart' as _i29;
import 'package:flutter/material.dart' as _i32;
import 'package:model/model.dart' as _i33;

abstract class $FeatureHomeModule extends _i31.AutoRouterModule {
  @override
  final Map<String, _i31.PageFactory> pagesMap = {
    ActiveRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ActivePage(),
      );
    },
    AddCommentRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(child: const _i2.AddCommentPage()),
      );
    },
    AddCustomerRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(child: const _i3.AddCustomerPage()),
      );
    },
    AdmissionsHistoryRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(child: const _i1.AdmissionsHistoryPage()),
      );
    },
    AnnouncementRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(child: const _i4.AnnouncementPage()),
      );
    },
    AuthRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(child: const _i5.AuthScreen()),
      );
    },
    BoardingRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.BoardingScreen(),
      );
    },
    BuyRoute.name: (routeData) {
      final args =
          routeData.argsAs<BuyRouteArgs>(orElse: () => const BuyRouteArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(
            child: _i7.BuyPage(
          key: args.key,
          param: args.param,
          type: args.type,
          historyOrder: args.historyOrder,
          partnerOrder: args.partnerOrder,
        )),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CategoryPage(),
      );
    },
    ChooseLanguageRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ChooseLanguagePage(),
      );
    },
    CompleteRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CompletePage(),
      );
    },
    CompletePartnerOrder.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CompletePartnerOrder(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.HistoryPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(
            child: _i13.MainPage(
          key: args.key,
          pages: args.pages,
          icons: args.icons,
          routes: args.routes,
        )),
      );
    },
    MapRouteRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.MapRoutePage(),
      );
    },
    MyAccountRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(child: const _i15.MyAccountPage()),
      );
    },
    OrderCardRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.OrderCardPage(),
      );
    },
    OrdersRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(child: const _i17.OrdersPage()),
      );
    },
    PartnersRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(child: const _i18.PartnersPage()),
      );
    },
    PaymentRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.PaymentPage(
          key: args.key,
          params: args.params,
        ),
      );
    },
    PaymentWithCardRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentWithCardRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(
            child: _i20.PaymentWithCardPage(
          key: args.key,
          params: args.params,
        )),
      );
    },
    PolygonRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.PolygonScreen(),
      );
    },
    PresentationRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(child: const _i22.PresentationPage()),
      );
    },
    PriceChangerRoute.name: (routeData) {
      final args = routeData.argsAs<PriceChangerRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(
            child: _i23.PriceChangerPage(
          key: args.key,
          product: args.product,
        )),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(child: const _i24.ProfilePage()),
      );
    },
    ReportRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.ReportScreen(),
      );
    },
    RoadMapRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.RoadMapPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(child: const _i27.SettingsPage()),
      );
    },
    SignatureRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.SignaturePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(child: const _i29.SplashScreen()),
      );
    },
    SubmissionRoute.name: (routeData) {
      final args = routeData.argsAs<SubmissionRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WrappedRoute(
            child: _i30.SubmissionPage(
          key: args.key,
          partnerId: args.partnerId,
          parnter: args.parnter,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.ActivePage]
class ActiveRoute extends _i31.PageRouteInfo<void> {
  const ActiveRoute({List<_i31.PageRouteInfo>? children})
      : super(
          ActiveRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActiveRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddCommentPage]
class AddCommentRoute extends _i31.PageRouteInfo<void> {
  const AddCommentRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AddCommentRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCommentRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddCustomerPage]
class AddCustomerRoute extends _i31.PageRouteInfo<void> {
  const AddCustomerRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AddCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCustomerRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i1.AdmissionsHistoryPage]
class AdmissionsHistoryRoute extends _i31.PageRouteInfo<void> {
  const AdmissionsHistoryRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AdmissionsHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdmissionsHistoryRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AnnouncementPage]
class AnnouncementRoute extends _i31.PageRouteInfo<void> {
  const AnnouncementRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AnnouncementRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnnouncementRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AuthScreen]
class AuthRoute extends _i31.PageRouteInfo<void> {
  const AuthRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i6.BoardingScreen]
class BoardingRoute extends _i31.PageRouteInfo<void> {
  const BoardingRoute({List<_i31.PageRouteInfo>? children})
      : super(
          BoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BoardingRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i7.BuyPage]
class BuyRoute extends _i31.PageRouteInfo<BuyRouteArgs> {
  BuyRoute({
    _i32.Key? key,
    _i33.OrderModel? param,
    String? type,
    _i33.ActiveHistory? historyOrder,
    _i33.PartnerOrder? partnerOrder,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          BuyRoute.name,
          args: BuyRouteArgs(
            key: key,
            param: param,
            type: type,
            historyOrder: historyOrder,
            partnerOrder: partnerOrder,
          ),
          initialChildren: children,
        );

  static const String name = 'BuyRoute';

  static const _i31.PageInfo<BuyRouteArgs> page =
      _i31.PageInfo<BuyRouteArgs>(name);
}

class BuyRouteArgs {
  const BuyRouteArgs({
    this.key,
    this.param,
    this.type,
    this.historyOrder,
    this.partnerOrder,
  });

  final _i32.Key? key;

  final _i33.OrderModel? param;

  final String? type;

  final _i33.ActiveHistory? historyOrder;

  final _i33.PartnerOrder? partnerOrder;

  @override
  String toString() {
    return 'BuyRouteArgs{key: $key, param: $param, type: $type, historyOrder: $historyOrder, partnerOrder: $partnerOrder}';
  }
}

/// generated route for
/// [_i8.CategoryPage]
class CategoryRoute extends _i31.PageRouteInfo<void> {
  const CategoryRoute({List<_i31.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ChooseLanguagePage]
class ChooseLanguageRoute extends _i31.PageRouteInfo<void> {
  const ChooseLanguageRoute({List<_i31.PageRouteInfo>? children})
      : super(
          ChooseLanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguageRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i1.CompletePage]
class CompleteRoute extends _i31.PageRouteInfo<void> {
  const CompleteRoute({List<_i31.PageRouteInfo>? children})
      : super(
          CompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompleteRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CompletePartnerOrder]
class CompletePartnerOrder extends _i31.PageRouteInfo<void> {
  const CompletePartnerOrder({List<_i31.PageRouteInfo>? children})
      : super(
          CompletePartnerOrder.name,
          initialChildren: children,
        );

  static const String name = 'CompletePartnerOrder';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i11.HistoryPage]
class HistoryRoute extends _i31.PageRouteInfo<void> {
  const HistoryRoute({List<_i31.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i12.HomePage]
class HomeRoute extends _i31.PageRouteInfo<void> {
  const HomeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i13.MainPage]
class MainRoute extends _i31.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i32.Key? key,
    required List<_i34.PageRouteInfo<dynamic>> pages,
    required List<String> icons,
    required List<String> routes,
    List<_i31.PageRouteInfo>? children,
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

  static const _i31.PageInfo<MainRouteArgs> page =
      _i31.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.pages,
    required this.icons,
    required this.routes,
  });

  final _i32.Key? key;

  final List<_i34.PageRouteInfo<dynamic>> pages;

  final List<String> icons;

  final List<String> routes;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, pages: $pages, icons: $icons, routes: $routes}';
  }
}

/// generated route for
/// [_i14.MapRoutePage]
class MapRouteRoute extends _i31.PageRouteInfo<void> {
  const MapRouteRoute({List<_i31.PageRouteInfo>? children})
      : super(
          MapRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRouteRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i15.MyAccountPage]
class MyAccountRoute extends _i31.PageRouteInfo<void> {
  const MyAccountRoute({List<_i31.PageRouteInfo>? children})
      : super(
          MyAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAccountRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i16.OrderCardPage]
class OrderCardRoute extends _i31.PageRouteInfo<void> {
  const OrderCardRoute({List<_i31.PageRouteInfo>? children})
      : super(
          OrderCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderCardRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i17.OrdersPage]
class OrdersRoute extends _i31.PageRouteInfo<void> {
  const OrdersRoute({List<_i31.PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i18.PartnersPage]
class PartnersRoute extends _i31.PageRouteInfo<void> {
  const PartnersRoute({List<_i31.PageRouteInfo>? children})
      : super(
          PartnersRoute.name,
          initialChildren: children,
        );

  static const String name = 'PartnersRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i19.PaymentPage]
class PaymentRoute extends _i31.PageRouteInfo<PaymentRouteArgs> {
  PaymentRoute({
    _i32.Key? key,
    required _i33.BuyReq params,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          PaymentRoute.name,
          args: PaymentRouteArgs(
            key: key,
            params: params,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentRoute';

  static const _i31.PageInfo<PaymentRouteArgs> page =
      _i31.PageInfo<PaymentRouteArgs>(name);
}

class PaymentRouteArgs {
  const PaymentRouteArgs({
    this.key,
    required this.params,
  });

  final _i32.Key? key;

  final _i33.BuyReq params;

  @override
  String toString() {
    return 'PaymentRouteArgs{key: $key, params: $params}';
  }
}

/// generated route for
/// [_i20.PaymentWithCardPage]
class PaymentWithCardRoute
    extends _i31.PageRouteInfo<PaymentWithCardRouteArgs> {
  PaymentWithCardRoute({
    _i32.Key? key,
    required _i33.BuyReq params,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          PaymentWithCardRoute.name,
          args: PaymentWithCardRouteArgs(
            key: key,
            params: params,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentWithCardRoute';

  static const _i31.PageInfo<PaymentWithCardRouteArgs> page =
      _i31.PageInfo<PaymentWithCardRouteArgs>(name);
}

class PaymentWithCardRouteArgs {
  const PaymentWithCardRouteArgs({
    this.key,
    required this.params,
  });

  final _i32.Key? key;

  final _i33.BuyReq params;

  @override
  String toString() {
    return 'PaymentWithCardRouteArgs{key: $key, params: $params}';
  }
}

/// generated route for
/// [_i21.PolygonScreen]
class PolygonRoute extends _i31.PageRouteInfo<void> {
  const PolygonRoute({List<_i31.PageRouteInfo>? children})
      : super(
          PolygonRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolygonRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i22.PresentationPage]
class PresentationRoute extends _i31.PageRouteInfo<void> {
  const PresentationRoute({List<_i31.PageRouteInfo>? children})
      : super(
          PresentationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PresentationRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i23.PriceChangerPage]
class PriceChangerRoute extends _i31.PageRouteInfo<PriceChangerRouteArgs> {
  PriceChangerRoute({
    _i32.Key? key,
    required _i33.Product product,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          PriceChangerRoute.name,
          args: PriceChangerRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'PriceChangerRoute';

  static const _i31.PageInfo<PriceChangerRouteArgs> page =
      _i31.PageInfo<PriceChangerRouteArgs>(name);
}

class PriceChangerRouteArgs {
  const PriceChangerRouteArgs({
    this.key,
    required this.product,
  });

  final _i32.Key? key;

  final _i33.Product product;

  @override
  String toString() {
    return 'PriceChangerRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i24.ProfilePage]
class ProfileRoute extends _i31.PageRouteInfo<void> {
  const ProfileRoute({List<_i31.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i25.ReportScreen]
class ReportRoute extends _i31.PageRouteInfo<void> {
  const ReportRoute({List<_i31.PageRouteInfo>? children})
      : super(
          ReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i26.RoadMapPage]
class RoadMapRoute extends _i31.PageRouteInfo<void> {
  const RoadMapRoute({List<_i31.PageRouteInfo>? children})
      : super(
          RoadMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoadMapRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i27.SettingsPage]
class SettingsRoute extends _i31.PageRouteInfo<void> {
  const SettingsRoute({List<_i31.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i28.SignaturePage]
class SignatureRoute extends _i31.PageRouteInfo<void> {
  const SignatureRoute({List<_i31.PageRouteInfo>? children})
      : super(
          SignatureRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignatureRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i29.SplashScreen]
class SplashRoute extends _i31.PageRouteInfo<void> {
  const SplashRoute({List<_i31.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i30.SubmissionPage]
class SubmissionRoute extends _i31.PageRouteInfo<SubmissionRouteArgs> {
  SubmissionRoute({
    _i32.Key? key,
    required int partnerId,
    required _i33.PartnerItem parnter,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          SubmissionRoute.name,
          args: SubmissionRouteArgs(
            key: key,
            partnerId: partnerId,
            parnter: parnter,
          ),
          initialChildren: children,
        );

  static const String name = 'SubmissionRoute';

  static const _i31.PageInfo<SubmissionRouteArgs> page =
      _i31.PageInfo<SubmissionRouteArgs>(name);
}

class SubmissionRouteArgs {
  const SubmissionRouteArgs({
    this.key,
    required this.partnerId,
    required this.parnter,
  });

  final _i32.Key? key;

  final int partnerId;

  final _i33.PartnerItem parnter;

  @override
  String toString() {
    return 'SubmissionRouteArgs{key: $key, partnerId: $partnerId, parnter: $parnter}';
  }
}
