import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/cart/widgets/add_btn.dart';
import 'package:hungry/shared/custom_btn.dart';
import 'package:hungry/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.title,
    required this.des,
    this.onMinusTap,
    this.onAddTap,
    required this.number,
     this.removeTap,
  });
  final String image;
  final String title;
  final String des;
  final Function()? onMinusTap;
  final Function()? onAddTap;
  final Function()? removeTap;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image, width: 100.w),
                CustomText(text: title, weight: FontWeight.bold),
                CustomText(text: des),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    // minus btn
                    AddBtn(
                      onTap: onMinusTap,
                      icon: Icon(CupertinoIcons.minus, color: Colors.white),
                    ),

                    Gap(20.w),
                    CustomText(
                      text: number.toString(),
                      weight: FontWeight.bold,
                      size: 17.sp,
                    ),
                    Gap(20.w),

                    AddBtn(
                      onTap: onAddTap,
                      icon: Icon(CupertinoIcons.add, color: Colors.white),
                    ),
                  ],
                ),
                Gap(22.h),

                CustomBtn(
                  onTap: removeTap,
                  text: 'Remove',

                  horizontalPadding: 42,
                  verticalPadding: 9.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
