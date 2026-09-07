import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/checkout/widget/check_out_rows.dart';

import 'package:hungry/shared/price_bar.dart';

class ChekoutView extends StatefulWidget {
  const ChekoutView({super.key});

  @override
  State<ChekoutView> createState() => _ChekoutViewState();
}

class _ChekoutViewState extends State<ChekoutView> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Gap(22.h),
            CheckOutRows(
              text: 'Order',
              price: '130',
              color: Colors.grey.shade700,
            ),
            Gap(16.h),
            CheckOutRows(
              text: 'Taxes',
              price: '5',
              color: Colors.grey.shade700,
            ),
            Gap(16.h),
            CheckOutRows(
              text: 'Delivery fees',
              price: '25',
              color: Colors.grey.shade700,
            ),

            Gap(9.h),
            Divider(
              color: Colors.grey.shade400,
              indent: 21.w,
              endIndent: 21.w,
              thickness: 1,
            ),
            Gap(26.h),

            CheckOutRows(
              text: 'Total',
              price: '160',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            Gap(22.h),
            CheckOutRows(
              text: 'Estimated delivery time:',
              price: '15 - 30 mins',
              color: Colors.black,
              size: 15.sp,
              eGP: '',
              fontWeight: FontWeight.w400,
            ),
            Gap(68.h),
            Text(
              'Payment method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Gap(22.h),
            ListTile(
              tileColor: Color(0xFF3C2F2F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 8.h,
              ),
              title: Text(
                'Cash on Delivery',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              leading: Image.asset('assets/cash.png'),
              trailing: Radio<String>(
                activeColor: Colors.white,
                value: 'Cash',
                groupValue: 'Cash',
                onChanged: (v) {},
              ),
            ),
            Gap(27.h),
            ListTile(
              tileColor: Color(0xFFF3F4F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 8.h,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Debit Card',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Gap(5.h),
                  Text(
                    '3566 **** **** 0505',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
              leading: Image.asset('assets/visa.png', width: 80.w),
              trailing: Radio<String>(
                activeColor: AppColors.primaryColor,
                value: 'cash',
                groupValue: 'Cash',
                onChanged: (v) {},
              ),
            ),
            Gap(10.h),
            Row(
              children: [
                Checkbox(
                  value: isChecked,

                  activeColor: Colors.red,
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),

                Text(
                  'Save card details for future payments',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
              ],
            ),
            Spacer(),
            PriceBar(
              total: 160,
              customBtn: 'Pay Now',
              customBtnFontSize: 18,
              customBtnHoreizentalPadding: 40,
            ),

            Gap(36.h),
          ],
        ),
      ),
    );
  }
}
