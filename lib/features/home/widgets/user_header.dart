import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Column logo & welcome word
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(15.h),

            // logo set
            SvgPicture.asset(
              'assets/logo/logo.svg',
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
              height: 40.h,
            ),

            Gap(5),

            // welcome word
            CustomText(
              text: 'Hello , Saif Moamer',
              size: 18,
              color: AppColors.greyColor,
              weight: FontWeight.w500,
            ),
          ],
        ),

        Spacer(),

        // User Image
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primaryColor,
          child: Icon(CupertinoIcons.person, color: Colors.white),
        ),
      ],
    );
  }
}
