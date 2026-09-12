import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String selectedMethod = 'cash';

  // ألوان الـ Payment Method
  static const Color cardColor = Color(0xFFFAFAFA);
  static const Color textColor = Color(0xFF3C2F2F);
  static const Color primaryColor = Color(0xFFE53935);

  void _selectMethod(String method) {
    setState(() {
      selectedMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.h,
      children: [
        // =========================
        //     Cash on Delivery
        // =========================
        ListTile(
          onTap: () => _selectMethod('cash'), // الضغط على الكارت كامل
          tileColor: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              color: selectedMethod == 'cash'
                  ? Colors.green.shade600
                  : Colors.grey.shade200,
              width: selectedMethod == 'cash' ? 1.5.w : 1.w,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          title: Text(
            'Cash on Delivery',
            style: TextStyle(
              color: textColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: Image.asset('assets/cash.png', width: 32.w),
          trailing: Radio<String>(
            value: 'cash',
            groupValue: selectedMethod,
            activeColor: Colors.green.shade600,
            onChanged: (value) => _selectMethod(value!),
          ),
        ),

        // =========================
        //        Debit Card
        // =========================
        ListTile(
          onTap: () => _selectMethod('visa'), // الضغط على الكارت كامل
          tileColor: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              color: selectedMethod == 'visa'
                  ? Colors.blue.shade600
                  : Colors.grey.shade200,
              width: selectedMethod == 'visa' ? 1.5.w : 1.w,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Debit Card',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Gap(2.h),
              Text(
                '3566 **** **** 0505',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
              ),
            ],
          ),
          leading: Image.asset('assets/visa.png', width: 40.w),
          trailing: Radio<String>(
            value: 'visa',
            groupValue: selectedMethod,
            activeColor: Colors.blue.shade600,
            onChanged: (value) => _selectMethod(value!),
          ),
        ),

        // =========================
        //      Vodafone Cash
        // =========================
        ListTile(
          onTap: () => _selectMethod('vodafone'),
          tileColor: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              color: selectedMethod == 'vodafone'
                  ? primaryColor
                  : Colors.grey.shade200,
              width: selectedMethod == 'vodafone' ? 1.5.w : 1.w,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vodafone Cash',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Gap(2.h),
              Text(
                '01090107189',
                style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
              ),
            ],
          ),
          leading: Image.asset('assets/vodafone.png', width: 40.w),
          trailing: Radio<String>(
            value: 'vodafone',
            groupValue: selectedMethod,
            activeColor: primaryColor,
            onChanged: (value) => _selectMethod(value!),
          ),
        ),
      ],
    );
  }
}