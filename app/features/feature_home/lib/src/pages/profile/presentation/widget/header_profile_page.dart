import 'package:core/core.dart';
import 'package:design_system/design_system.dart' hide AppImage;
import 'package:flutter/material.dart';
import 'package:model/model.dart';


class HeaderProfilePage extends StatelessWidget {
  final UserProfile? userProfile;
  const HeaderProfilePage({super.key,required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppIcons.iconBackground,
            ),
            IconButton(onPressed: (){
              context.router.popForced();
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
                      userProfile?.name??'Name',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      userProfile?.phoneUI??'phone number',
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
    );
  }
}
