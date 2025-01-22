
import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart' hide AppImage;
import 'package:feature_home/src/pages/profile/presentation/widget/header_profile_page.dart';
import 'package:feature_home/src/pages/profile/presentation/widget/payment_item.dart';
import 'package:feature_home/src/responsive.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:model/model.dart';

import '../../../../feature_home.dart';
import '../data/model/payment_history.dart';

part 'page/mobile/mobile.dart';
part 'page/mobile/partner_profile_page.dart';
part 'page/tablet/tablet.dart';
part 'widget/profile_widget.dart';
part 'widget/partner/partner_profile_widget.dart';

@RoutePage()
class ProfilePage extends StatelessWidget implements AutoRouteWrapper {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: _Mobile(), tablet: _Tablet());
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (context) {
            return AppBlocHelper.getProfileCubit();
          },
        ),
        BlocProvider<LogoutCubit>(
          create: (context) {
            return AppBlocHelper.getLogoutCubit();
          },
        ),
        BlocProvider<ThemeChangerCubit>(
          create: (context) {
            return AppBlocHelper.getThemeChangeCubit();
          },
        ),
      ],
      child: this,
    );
  }
}
