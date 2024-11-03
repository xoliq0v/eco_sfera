import 'package:design_system/design_system.dart' hide AppImage;
import 'package:flutter/material.dart';


class HeaderProfilePage extends StatefulWidget {
  const HeaderProfilePage({super.key});

  @override
  State<HeaderProfilePage> createState() => _HeaderProfilePageState();
}

class _HeaderProfilePageState extends State<HeaderProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: AppScreen.statusBarHeight + 200.h,
        width: double.maxFinite,
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.bucolic,
                    Theme.of(context).colorScheme.secondary
                  ]
              ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppIcons.iconBackground,
                ),
                IconButton(onPressed: (){

                }, icon: Icon(Icons.arrow_back_ios,size: 20,color: Theme.of(context).colorScheme.background,),),
                15.verticalSpace,
                Row(
                  children: [
                    //https://www.wilsoncenter.org/sites/default/files/media/images/person/james-person-1.jpg
                    InkWell(
                      onTap:(){
                        ChangeAvatarBottomSheet.show(context);
                      },
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.wilsoncenter.org/sites/default/files/media/images/person/james-person-1.jpg'
                        ),
                        maxRadius: 30,
                      ),
                    ),
                    15.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Roderick Usher',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.w700,
                              fontSize: 20
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          '+998 71 234 56 78',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Theme.of(context).colorScheme.background,
                          ),
                        )
                      ],
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
