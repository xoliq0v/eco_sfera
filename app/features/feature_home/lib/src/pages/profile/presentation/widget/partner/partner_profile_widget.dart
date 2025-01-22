part of '../../profile_page.dart';

class _PartnerProfileWidget extends StatelessWidget {
  final PartnerInfoModel? partner;
  const _PartnerProfileWidget({super.key,this.partner});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme
        .of(context)
        .colorScheme;
    return CustomScrollView(
        slivers: [
          HeaderProfilePage(partner: partner,).toBoxAdapter(),
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
                        BlocBuilder<LogoutCubit,LogoutState>(
                            builder: (context,state){
                              final isLoading = state.maybeWhen(
                                loading: () => true,
                                orElse: () => false,
                              );
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: EcoElevatedButton.loading(
                                    loading: isLoading,
                                    onPressed: ()async{
                                      await LogOutDialog.showLogoutDialog(context).then((value){
                                        if(value ?? false){
                                          _logout(context);
                                        }
                                      });
                                    }, child: Text(LocaleKeys.exit.tr(context: context))
                                ),
                              );
                            }
                        )
                      ]
                  )
              )
          )
        ]
    );
  }

  Future<void> navigateAccountRoute() async{
    return NavigationUtils.getMainNavigator().navigateMyAccountPage();
  }

  Future<void> navigateSettingsRoute() async{
    return NavigationUtils.getMainNavigator().navigateSettingsPage();
  }

  void _logout(BuildContext context){
    context.read<LogoutCubit>().logout();
  }
}
