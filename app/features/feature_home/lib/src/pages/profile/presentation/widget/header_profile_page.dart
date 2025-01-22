import 'dart:developer';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart' hide AppImage;
import 'package:flutter/material.dart';
import 'package:model/model.dart';


class HeaderProfilePage extends StatelessWidget {
  final PartnerInfoModel? partner;
  final DriverData? userProfile;
  const HeaderProfilePage({super.key,this.partner,this.userProfile});

  @override
  Widget build(BuildContext context) {
    print(userProfile != null);
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
            50.verticalSpace,
            Row(
              children: [
                //https://www.wilsoncenter.org/sites/default/files/media/images/person/james-person-1.jpg
                userProfile != null ? InkWell(
                  onTap:(){
                    ChangeAvatarBottomSheet.show(context);
                  },
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        userProfile?.profileImage ?? ''
                    ),
                    maxRadius: 30,
                  ),
                ) : SizedBox.shrink(),
                15.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userProfile != null ? '${userProfile?.name} ${userProfile?.surname} ' : '${partner?.nickname}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      userProfile == null ? partner?.phone?.formatUzbekPhoneNumber()??'' : userProfile?.phone??'Phone empty',
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
