import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/setting/widgets/custom_btn_setting.dart';
import 'package:hungry/shared/custom_btn.dart';
import 'package:hungry/shared/custom_text.dart';

class PriceBar extends StatelessWidget {
  const PriceBar({
    super.key,
    required this.total,
    required this.customBtn,
    this.customBtnVerticalPadding = 15,
    this.customBtnHoreizentalPadding = 35,
    this.customBtnFontSize = 16,
    this.onBtnTap,
  });
  final double total;
  final String customBtn;
  final Function()? onBtnTap;
  final double customBtnVerticalPadding;
  final double customBtnHoreizentalPadding;
  final double customBtnFontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Gap(12.w),
        // total
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              CustomText(text: 'Total', size: 20.sp, weight: FontWeight.w900),

              Row(
                spacing: 2,
                children: [
                  CustomText(text: 'EGP', size: 16.sp, weight: FontWeight.w900),
                  CustomText(
                    text: '$total',
                    size: 30.sp,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
        ),

        // btn
        Container(
          margin: EdgeInsets.only(bottom: 16.h),
          height: 65,
          child: CustomBtn(
            onTap: onBtnTap,
            text: customBtn,
            verticalPadding: customBtnVerticalPadding,
            horizontalPadding: customBtnHoreizentalPadding,
            size: customBtnFontSize,
          ),
        ),
      ],
    );
  }
}
