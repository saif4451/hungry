import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_btn.dart';
import 'package:hungry/shared/custom_text.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: Colors.white,
        title: CustomText(text: 'History',weight: FontWeight.w600,),
        centerTitle: true,
        elevation: 0,
        
        
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              shadowColor: AppColors.greyColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/test.png', width: 130.w),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            CustomText(
                              text: 'Hamburger',
                              size: 18,
                              weight: FontWeight.w600,
                            ),
                            CustomText(
                              text: 'Qty : x3',
                              size: 16,
                              weight: FontWeight.w500,
                            ),
                            CustomText(
                              text: 'price : EGP 180',
                              size: 16,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(20.h),
                    CustomBtn(text: 'RE-Oreder Now', size: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
