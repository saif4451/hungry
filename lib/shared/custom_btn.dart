import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.onTap,
    this.horizontalPadding = 35,
    this.verticalPadding = 12,
    this.containerColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.containerRadius = 16,
    required this.text,
    this.size = 14,
  });

  final String text;
  final Function()? onTap;

  final double horizontalPadding;
  final double verticalPadding;

  final Color containerColor;
  final Color textColor;

  final double containerRadius;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding.w,
          vertical: verticalPadding.h,
        ),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(
            containerRadius.r,
          ),
        ),
        child: Center(
          child: CustomText(
            text: text,
            color: textColor,
            weight: FontWeight.w600,
            size: size.sp,
          ),
        ),
      ),
    );
  }
}