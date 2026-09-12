import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/utils/validators.dart';
import 'package:hungry/features/auth/widgets/custom_login_btn.dart';
import 'package:hungry/shared/custom_text_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  // Controllers

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

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
                  Gap(55.h),

                  Center(
                    child: SvgPicture.asset(
                      'assets/logo/logo.svg',
                      width: 300.w,
                    ),
                  ),

                  Gap(25.h),

                  Text(
                    'Join Hungry and enjoy delicious meals anytime.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                  Gap(30.h),
                  Text(
                    'Create Your Account 🍔',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  Gap(20.h),

                  CustomTextField(
                    hint: 'Name',
                    controller: nameController,
                    icon: const Icon(Icons.person_outline),
                    validator: AppValidators.validateName,
                  ),

                  Gap(18.h),

                  CustomTextField(
                    hint: 'Email Address',
                    controller: emailController,
                    icon: const Icon(Icons.email_outlined),
                    validator: AppValidators.validateEmail,
                  ),

                  Gap(18.h),

                  CustomTextField(
                    hint: 'Password',
                    controller: passwordController,
                    icon: const Icon(Icons.lock_outline),
                    isPassword: true,
                    validator: AppValidators.validatePassword,
                  ),

                  Gap(18.h),

                  // =========================
                  // Confirm Password
                  // =========================
                  CustomTextField(
                    hint: 'Confirm Password',
                    controller: confirmPasswordController,
                    icon: const Icon(Icons.lock_outline),
                    isPassword: true,
                    validator: (value) => AppValidators.validateConfirmPassword(
                      value,
                      passwordController.text,
                    ),
                  ),

                  Gap(30.h),

                  GestureDetector(
                    onTap: () {
                      // 1. التحقق من صحة البيانات (بما فيها تطابق الباسورد من الـ Validator)
                      if (!formKey.currentState!.validate()) return;

                      // 2. إخفاء الكيبورد فور الضغط على الزرار (تحسين UX)
                      FocusScope.of(context).unfocus();

                      // TODO: Sign Up Logic / Cubit Call
                    },
                    child: const CustomLoginBtn(text: 'Sign Up'),
                  ),

                  Gap(22.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        'Already have an account?',
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 12.sp,
                        ),
                      ),

                      Gap(5.w),

                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },

                        child: Text(
                          'Login',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
