// import 'package:eco_sfera/core/assets/app_icons.dart';
// import 'package:eco_sfera/core/assets/theme/app_colors.dart';
// import 'package:eco_sfera/core/extension/localization_extension.dart';
// import 'package:eco_sfera/features/orders/presentation/orders_page.dart';
// import 'package:eco_sfera/features/payment/presentation/payment_page.dart';
// import 'package:eco_sfera/features/profile/presentation/profile_page.dart';
// import 'package:flutter/material.dart';
// import 'package:auto_route/annotations.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';
//
// import '../../../core/libs/motion_tab_bar/motion-tab-bar.dart';
// import '../../../core/libs/motion_tab_bar/motion-tab-controller.dart';
// import '../../history/presentation/history_page.dart';
//
//
// @RoutePage()
// class SecondaryMain extends StatefulWidget {
//   const SecondaryMain({super.key, required this.isSecondary});
//   final bool isSecondary;
//
//   @override
//   State<SecondaryMain> createState() => _SecondaryMainState();
// }
//
// class _SecondaryMainState extends State<SecondaryMain> with TickerProviderStateMixin {
//
//   MotionTabBarController? _motionTabBarController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     //// use "MotionTabBarController" to replace with "TabController", if you need to programmatically change the tab
//     _motionTabBarController = MotionTabBarController(
//       initialIndex: 1,
//       length: 5,
//       vsync: this,
//     );
//   }
//
//
//   @override
//   void dispose() {
//     super.dispose();
//
//     // _tabController.dispose();
//     _motionTabBarController!.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var l10n = context.l10n;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         automaticallyImplyLeading: false,
//         actions: [
//           Padding(
//               padding: const EdgeInsets.all(15),
//             child: SvgPicture.asset(AppIcons.userProfile02),
//           )
//         ],
//         leading: null,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(l10n.totalBalance,style: Theme.of(context).textTheme.headlineMedium,),
//             Text('100 000sum',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),)
//           ],
//         ),
//       ),
//       body: PageView(
//         physics: const NeverScrollableScrollPhysics(),
//         children: const [
//           YandexMap(),
//           OrdersPage(),
//           PaymentPage(),
//           HistoryPage(),
//           ProfilePage()
//         ],
//       ),
//       bottomNavigationBar: MotionTabBar(
//         controller: _motionTabBarController, // ADD THIS if you need to change your tab programmatically
//         initialSelectedTab: "Home",
//         labels: const ["Home", "Menu", "Payment", "History", "Profile"],
//         // icons: const [Icons.dashboard, Icons.home, Icons.people_alt, Icons.settings],
//         svgIconPaths: const [
//           AppIcons.home03,
//           AppIcons.menu02,
//           AppIcons.coinsRotate,
//           AppIcons.clockForward,
//           AppIcons.userProfile02,
//         ],
//         // optional badges, length must be same with labels
//         badges: const [
//           // Default Motion Badge Widget
//           null,
//
//           // custom badge Widget
//           null,
//
//           // allow null
//           null,
//
//           // Default Motion Badge Widget with indicator only
//           null,
//
//           null
//         ],
//         tabSize: 50,
//         tabBarHeight: 60,
//         textStyle: const TextStyle(
//           fontSize: 12,
//           color: Colors.black,
//           fontWeight: FontWeight.w500,
//         ),
//         tabIconColor: AppColors.main,
//         tabIconSize: 28.0,
//         tabIconSelectedSize: 26.0,
//         tabSelectedColor: AppColors.cactusWater,
//         tabIconSelectedColor: AppColors.main,
//         onTabItemSelected: (int value) {
//           setState(() {
//             // _tabController!.index = value;
//             _motionTabBarController!.index = value;
//           });
//         },
//       ),
//     );
//   }
//
//   // Default set of items
//   List<BottomNavigationBarItem> _defaultItems() {
//     return [
//       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//       BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//       BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
//     ];
//   }
//
//   // Alternate set of items
//   List<BottomNavigationBarItem> _alternateItems() {
//     return [
//       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//       BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//       BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
//     ];
//   }
// }
//
