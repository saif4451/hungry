import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/checkout/widget/check_out_rows.dart';
import 'package:hungry/features/checkout/widget/payment_method.dart';
import 'package:hungry/shared/price_bar.dart';

class ChekoutView extends StatefulWidget {
  const ChekoutView({super.key});

  @override
  State<ChekoutView> createState() => _ChekoutViewState();
}

class _ChekoutViewState extends State<ChekoutView> {
  bool isChecked = false;
  String selectedMethod = 'cash';
  final double total = 160 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, size: 22.sp, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order summary',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Gap(16.h),
                      CheckOutRows(
                        text: 'Order',
                        price: '130',
                        color: Colors.grey.shade700,
                      ),
                      Gap(12.h),
                      CheckOutRows(
                        text: 'Taxes',
                        price: '5',
                        color: Colors.grey.shade700,
                      ),
                      Gap(12.h),
                      CheckOutRows(
                        text: 'Delivery fees',
                        price: '25',
                        color: Colors.grey.shade700,
                      ),
                      Gap(12.h),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      Gap(12.h),
                      CheckOutRows(
                        text: 'Total',
                        price: '160',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      Gap(16.h),
                      CheckOutRows(
                        text: 'Estimated delivery time:',
                        price: '15 - 30 mins',
                        color: Colors.black,
                        size: 14.sp,
                        eGP: '',
                        fontWeight: FontWeight.w400,
                      ),
                      Gap(28.h),
                      Text(
                        'Payment method',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Gap(16.h),



                      PaymentMethod(),



                      Gap(8.h),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: Colors.red,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              'Save card details for future payments',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(16.h),
                    ],
                  ),
                ),
              ),

              // Bottom PriceBar

            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        height: 130.h,
        child: PriceBar(customBtnFontSize: 16,

          customBtnHoreizentalPadding: 30,
          total: total,
          customBtn: 'Pay Now',
          onBtnTap: () {

          },
        ),
      ),
    );
  }
}