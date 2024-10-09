import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_sfera/core/assets/app_icons.dart';
import 'package:eco_sfera/core/assets/app_image.dart';
import 'package:eco_sfera/core/assets/theme/app_colors.dart';
import 'package:eco_sfera/core/constants/route/app_router.gr.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/widgets/buttons/eco_button.dart';
import 'package:eco_sfera/core/widgets/dialogs/change_avatar_bottom_sheet.dart';
import 'package:eco_sfera/core/widgets/dialogs/change_language_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    var l10n = context.l10n;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.bucolic,
                        colorScheme.secondary
                      ]
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(30),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,size: 20,color: colorScheme.background,),),
                    const Gap(25),
                    Row(
                      children: [
                        //https://www.wilsoncenter.org/sites/default/files/media/images/person/james-person-1.jpg
                        InkWell(
                          onTap:(){
                            ChangeAvatarBottomSheet.show(context);
                          },
                          child: const CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                              'https://www.wilsoncenter.org/sites/default/files/media/images/person/james-person-1.jpg'
                            ),
                            maxRadius: 30,
                          ),
                        ),
                        const Gap(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Roderick Usher',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: colorScheme.background,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                              ),
                            ),
                            const Gap(5),
                            Text(
                                '+998 71 234 56 78',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: colorScheme.background,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppImage.iconBackground,
                  ),
                ],
              )
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.65,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: colorScheme.background,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Column(
                children: [
                  const Gap(30),
                  InkWell(
                    onTap: (){
                      context.router.navigate(const MyAccountRoute());
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: colorScheme.surface,
                          width: 2
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Gap(10),
                          SvgPicture.asset(AppIcons.arrowUp,color: colorScheme.primary,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Lorem ipsum',style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 10),),
                              Text('9 255 549', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colorScheme.secondary,fontSize: 16,fontWeight: FontWeight.w700),)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 7,bottom: 7),
                            child: VerticalDivider(
                              color: colorScheme.surface,
                              thickness: 1,
                              width: 20,
                            ),
                          ),
                          SvgPicture.asset(AppIcons.arrowDown,color: colorScheme.primary,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Lorem ipsum',style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 10),),
                              Text('10 000 000', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colorScheme.secondary,fontSize: 16,fontWeight: FontWeight.w700),)
                            ],
                          ),
                          const Gap(10)
                        ],
                      ),
                    ),
                  ),
                  const Gap(30),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
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
                        const Gap(15),
                        SvgPicture.asset(AppIcons.bell02,color: colorScheme.primary,),
                        const Gap(10),
                        Text(l10n.notifications)
                      ],
                    ),
                  ),
                  const Gap(10),
                  InkWell(
                    onTap: (){
                      ChangeLanguageSheet.show(context);
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
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
                          const Gap(15),
                          SvgPicture.asset(AppIcons.globe01,color: colorScheme.primary,),
                          const Gap(10),
                          Text(l10n.language)
                        ],
                      ),
                    ),
                  ),
                  const Gap(10),
                  InkWell(
                    onTap: (){
                      context.router.navigate(const SettingsRoute());
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
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
                          const Gap(15),
                          SvgPicture.asset(AppIcons.settings,color: colorScheme.primary,),
                          const Gap(10),
                          Text(l10n.settings)
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:  EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.1),
                      child: Text(
                          l10n.contactPhoneNumber,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  const Gap(5),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
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
                        const Gap(15),
                        SvgPicture.asset(AppIcons.phone,color: colorScheme.primary,),
                        const Gap(10),
                        const Text('+998 95-778-56-57')
                      ],
                    ),
                  ),
                  const Gap(20),
                  EcoButton(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 55,
                      onPressed: (){}, child: Text(l10n.exit)
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
