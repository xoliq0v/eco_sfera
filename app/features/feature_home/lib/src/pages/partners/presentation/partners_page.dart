import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:navigation/navigation.dart';
import '../../../responsive.dart';
import 'package:flutter/material.dart';

import 'page/widget/history_item.dart';

part 'page/mobile/page.dart';
part 'page/widget/search_field.dart';
part 'page/widget/loading.dart';
part 'page/widget/search_body.dart';
part 'page/widget/bottom_loading.dart';

@RoutePage()
class PartnersPage extends StatelessWidget implements AutoRouteWrapper{
  const PartnersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: _Mobile(), tablet: SizedBox.shrink());
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PartnerPaginationCubit>(
            create: (context){
              return AppBlocHelper.getPartnerPaginationCubit();
            },
          )
        ],
        child: this
    );
  }
}
