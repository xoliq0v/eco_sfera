
part of '../../profile_page.dart';

class _Mobile extends StatefulWidget {
  const _Mobile({super.key});

  @override
  State<_Mobile> createState() => Mobile();
}

class Mobile extends State<_Mobile> {

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme
        .of(context)
        .colorScheme;
    return Material(
        color: Theme
            .of(context)
            .colorScheme
            .secondary,
        child: CustomScrollView(
            slivers: [
              const HeaderProfilePage().toBoxAdapter(),
              SliverFillRemaining(
                  hasScrollBody: true,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .background,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          )
                      ),
                      child: Column(
                          children: [
                            30.verticalSpace,
                            InkWell(
                              onTap: () {
                                navigateAccountRoute();
                              },
                              child: SizedBox(
                                width: MediaQuery
                                    .sizeOf(context)
                                    .width * 0.9,
                                height: 70,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: colorScheme.surface,
                                          width: 2
                                      )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,
                                    children: [
                                      10.horizontalSpace,
                                      SvgPicture.asset(AppIcons.arrowUp,
                                        color: colorScheme.primary,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text('Lorem ipsum', style: Theme
                                              .of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(fontSize: 10),),
                                          Text('9 255 549', style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                              color: colorScheme.secondary,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),)
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 7, bottom: 7),
                                        child: VerticalDivider(
                                          color: colorScheme.surface,
                                          thickness: 1,
                                          width: 20,
                                        ),
                                      ),
                                      SvgPicture.asset(AppIcons.arrowDown,
                                        color: colorScheme.primary,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text('Lorem ipsum', style: Theme
                                              .of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(fontSize: 10),),
                                          Text('10 000 000', style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                              color: colorScheme.secondary,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),)
                                        ],
                                      ),
                                      10.horizontalSpace
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            30.verticalSpace,
                            SizedBox(
                              width: MediaQuery
                                  .sizeOf(context)
                                  .width * 0.9,
                              height: 55,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: colorScheme.surface,
                                        width: 2
                                    )
                                ),
                                child: Row(
                                  children: [
                                    15.horizontalSpace,
                                    SvgPicture.asset(AppIcons.bell02,
                                      color: colorScheme.primary,),
                                    15.horizontalSpace,
                                    Text(LocaleKeys.notifications.tr(
                                        context: context))
                                  ],
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            InkWell(
                              onTap: () {
                                ChangeLanguageSheet.show(context);
                              },
                              child: SizedBox(
                                width: MediaQuery
                                    .sizeOf(context)
                                    .width * 0.9,
                                height: 55,
                                child: DecoratedBox(

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: colorScheme.surface,
                                          width: 2
                                      )
                                  ),
                                  child: Row(
                                    children: [
                                      15.horizontalSpace,
                                      SvgPicture.asset(AppIcons.globe01,
                                        color: colorScheme.primary,),
                                      15.horizontalSpace,
                                      Text(LocaleKeys.language.tr(
                                          context: context))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            InkWell(
                              onTap: () {
                                navigateSettingsRoute();
                              },
                              child: Container(
                                width: MediaQuery
                                    .sizeOf(context)
                                    .width * 0.9,
                                height: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: colorScheme.surface,
                                        width: 2
                                    )
                                ),
                                child: Row(
                                  children: [
                                    10.horizontalSpace,
                                    SvgPicture.asset(AppIcons.settings,
                                      color: colorScheme.primary,),
                                    10.horizontalSpace,
                                    Text(LocaleKeys.settings.tr(
                                        context: context))
                                  ],
                                ),
                              ),
                            ),
                            20.verticalSpace,
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: MediaQuery
                                    .sizeOf(context)
                                    .width * 0.1),
                                child: Text(
                                  LocaleKeys.contactPhoneNumber.tr(
                                      context: context),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineSmall,
                                ),
                              ),
                            ),
                            5.verticalSpace,
                            SizedBox(
                              width: MediaQuery
                                  .sizeOf(context)
                                  .width * 0.9,
                              height: 55,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: colorScheme.surface,
                                        width: 2
                                    )
                                ),
                                child: Row(
                                  children: [
                                    15.horizontalSpace,
                                    SvgPicture.asset(AppIcons.phone,
                                      color: colorScheme.primary,),
                                    10.horizontalSpace,
                                    const Text('+998 95-778-56-57')
                                  ],
                                ),
                              ),
                            ),
                            20.verticalSpace,
                            EcoButton(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 55,
                                onPressed: (){}, child: Text(LocaleKeys.exit.tr(context: context))
                            )
                          ]
                      )
                  )
              )
            ]
        )
    );
  }

  Future<void> navigateAccountRoute() async{
    return NavigationUtils.getMainNavigator().navigateMyAccountPage();
  }

  Future<void> navigateSettingsRoute() async{
    return NavigationUtils.getMainNavigator().navigateSettingsPage();
  }

}