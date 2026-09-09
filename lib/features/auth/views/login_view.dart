import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry/features/auth/views/signup_view.dart';
import 'package:hungry/root.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';
import '../../../shared/custom_text_field.dart';
import '../widgets/custom_login_btn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        backgroundColor: AppColors.primaryColor,

        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),

            child: Form(
              key: formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Gap(80.h),

                  // =========================
                  // Logo
                  // =========================
                  Center(
                    child: SvgPicture.asset(
                      'assets/logo/logo.svg',
                      width: 300.w,
                    ),
                  ),

                  Gap(12.h),

                  // =========================
                  // Subtitle
                  // =========================
                  Center(
                    child: CustomText(
                      text: 'Delicious Meals, Delivered Fast',
                      color: Colors.white,
                      weight: FontWeight.w500,
                      size: 16.sp,
                    ),
                  ),

                  Gap(45.h),

                  Gap(30.h),

                  // =========================
                  // Email
                  // =========================
                  CustomTextField(
                    controller: emailController,
                    hint: 'Email Address',
                    icon: const Icon(Icons.email_outlined),
                  ),

                  Gap(18.h),

                  // =========================
                  // Password
                  // =========================
                  CustomTextField(
                    controller: passwordController,
                    hint: 'Password',
                    icon: const Icon(Icons.lock_outline),
                    isPassword: true,
                  ),

                  Gap(12.h),

                  // =========================
                  // Forgot Password
                  // =========================
                  Align(
                    alignment: Alignment.centerRight,

                    child: GestureDetector(
                      onTap: () {
                        // TODO: Forgot Password
                      },

                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Gap(35.h),

                  // =========================
                  // Login Button
                  // =========================
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        // TODO: Login with Firebase
                      }
                    },

                    child: CustomLoginBtn(text: 'Login'),
                  ),

                  Gap(25.h),

                  // =========================
                  // Divider
                  // =========================
                  Gap(12.h),
                  // =========================
                  // Divider
                  // =========================
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.white.withOpacity(0.35)),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),

                        child: Text(
                          'OR',
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Divider(color: Colors.white.withOpacity(0.35)),
                      ),
                    ],
                  ),
                  // =========================
                  // Create Account
                  // =========================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 12.sp,
                        ),
                      ),

                      Gap(5.w),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupView(),
                            ),
                          );
                        },

                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Gap(120.h),
                  // as a guest
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Root()),
                      );
                    },
                    child: Row(
                      spacing: 3.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue as a Guest ',

                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.login, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
