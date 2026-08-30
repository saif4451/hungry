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
    TextEditingController emailController = TextEditingController();
    TextEditingController pasworContoller = TextEditingController();
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: formkey ,
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
                    controller: emailController,
                    hint: 'Email Adress',
                    icon: Icon(Icons.email_outlined),
                  ),
                  Gap(40.h),
                  // step icon securty step **********************
                  CustomTextField(
                    controller: pasworContoller,
                    hint: 'Password',
                    icon: Icon(Icons.password),
                    isPassword: true,
                  ),
                  Gap(10.h),
              
                  Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          // todo sign page
                        },
                        child: Text(
                          'Sign Now',
                          
                          style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 1.3,
                          ),
                        ),
                      ),
                    Gap(10.w)
                    ],
                  ),
                  Gap(80.h),
                  // log in btn 
                  GestureDetector(
                    onTap: (){
                      if(formkey.currentState!.validate()){
                       // 
                       
                      }
                      

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: double.infinity,
                      height: 55.h,
                                  
                      child: Center(
                        child: CustomText(
                          text: 'Login',
                          color: AppColors.primaryColor,
                          weight: FontWeight.w700,
                          size: 20,
                        ),
                      ),
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
