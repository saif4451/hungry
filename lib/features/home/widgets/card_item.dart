import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.text,
    required this.des,
    required this.rate,
  });
  final String image, text, des, rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(

                children: [
                  Positioned(
                      right: 0,
                      left: 0,
                      bottom: -5,
          
                      child: Image.asset('assets/shadow.png')),
                  Center(child: Image.asset(image, width: 130.w, height: 130.h)),
          
                ],
              ),
              Gap(10.h),
              CustomText(text: text, size: 14.sp, weight: FontWeight.w600),
              CustomText(text: des, size: 14.sp, weight: FontWeight.w500),
              Row(
                children: [
                  CustomText(
                    text: '⭐ $rate',
                    size: 14.sp,
                    weight: FontWeight.w500,
                  ),
                  Spacer(),
                  Icon(
                    CupertinoIcons.heart,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
