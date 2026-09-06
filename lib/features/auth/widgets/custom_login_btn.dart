import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomLoginBtn extends StatelessWidget {
  const CustomLoginBtn({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      height: 55.h,

      child: Center(
        child: CustomText(
          text: text,
          color: AppColors.primaryColor,
          weight: FontWeight.w700,
          size: 20,
        ),
      ),
    );
  }
}
