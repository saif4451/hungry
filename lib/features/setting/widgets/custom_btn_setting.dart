import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomBtnSetting extends StatelessWidget {
  const CustomBtnSetting({
    super.key,
    this.onTap,

    this.containerColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.containerRadius = 20,
    required this.text,
    required this.icon,
  });
  final String text;

  final Function()? onTap;
  final Widget icon;
  final Color containerColor;
  final Color textColor;
  final double containerRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(containerRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 14.w,
          

          children: [
            CustomText(
              text: text,
              color: textColor,
              weight: FontWeight.w400,
              size: 20,
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
