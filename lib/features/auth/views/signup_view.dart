import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/widgets/custom_btn.dart';
import 'package:hungry/shared/custom_text_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController pasworContoller = TextEditingController();
    TextEditingController confirmPasworContoller = TextEditingController();
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Gap(150.h),
                // Logo
                Center(child: SvgPicture.asset('assets/logo/logo.svg')),
                Gap(70.h),
                CustomTextField(
                  hint: 'name',
                  controller: nameController,
                  icon: Icon(Icons.person),
                ),
                Gap(30.h),
                CustomTextField(
                  hint: 'Email',
                  controller: emailController,
                  icon: Icon(Icons.email_outlined),
                ),
                Gap(30.h),
                CustomTextField(
                  hint: 'Password',
                  controller: pasworContoller,
                  icon: Icon(Icons.password_outlined),
                  isPassword: true,
                ),
                Gap(30.h),
                CustomTextField(
                  hint: 'Confirm Password',
                  controller: confirmPasworContoller,
                  icon: Icon(Icons.password_outlined),
                  isPassword: true,
                ),
                Gap(50.h),
                GestureDetector(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      //
                    }
                  },
                  child: CustomBtn(text: 'Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
