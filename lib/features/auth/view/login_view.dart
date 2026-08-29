import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Gap(110.h),
                // Logo
                SvgPicture.asset('assets/logo/logo.svg'),
                Gap(10.h),
                // Text under logo
                CustomText(
                  text: 'Delicious Meals, Delivered Fast',
                  color: Colors.white,
                  weight: FontWeight.w500,
                  size: 13,
                ),
                Gap(40.h),
                CustomTextField(
                  hint: 'Email Adress',
                  icon: Icon(Icons.email_outlined),
                ),
                Gap(40.h),
                // step icon securty step **********************
                CustomTextField(
                  hint: 'Password',
                  icon: Icon(Icons.password),
                  isPassword: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
