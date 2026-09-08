import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/checkout/widget/check_out_rows.dart';
import 'package:hungry/shared/price_bar.dart';

class ChekoutView extends StatefulWidget {
  const ChekoutView({super.key});

  @override
  State<ChekoutView> createState() => _ChekoutViewState();
}

class _ChekoutViewState extends State<ChekoutView> {
  bool isChecked = false;
  String selectedMethod = 'cash';

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

                      // Cash Method
                      ListTile(
                        tileColor: const Color(0xFF3C2F2F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        title: Text(
                          'Cash on Delivery',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        leading: Image.asset('assets/cash.png', width: 32.w),
                        trailing: Radio<String>(
                          activeColor: Colors.white,
                          value: 'cash',
                          groupValue: selectedMethod,
                          onChanged: (v) {
                            setState(() {
                              selectedMethod = v!;
                            });
                          },
                        ),
                      ),
                      Gap(12.h),

                      // Debit Method
                      ListTile(
                        tileColor: Colors.blue.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Debit Card',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Gap(2.h),
                            Text(
                              '3566 **** **** 0505',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        leading: Image.asset('assets/visa.png', width: 40.w),
                        trailing: Radio<String>(
                          activeColor: Colors.white,
                          value: 'visa',
                          groupValue: selectedMethod,
                          onChanged: (v) {
                            setState(() {
                              selectedMethod = v!;
                            });
                          },
                        ),
                      ),
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: PriceBar(
                  total: 160,
                  customBtn: 'Pay Now',
                  customBtnFontSize: 18.sp,
                  customBtnHoreizentalPadding: 33.w,
                  onBtnTap: () {

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}