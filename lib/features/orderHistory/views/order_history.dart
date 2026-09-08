import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/checkout/view/chekout_view.dart';
import 'package:hungry/shared/custom_btn.dart';

import 'package:hungry/shared/custom_text.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order History',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
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
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
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
                    CustomBtn(
                       
                      text: 'RE-Oreder Now',
                      size: 16,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChekoutView()),
                      ),
                    ),
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
