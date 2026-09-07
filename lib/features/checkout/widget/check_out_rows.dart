import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_text.dart';

class CheckOutRows extends StatelessWidget {
  const CheckOutRows({
    super.key,
    required this.text,
    required this.price,
    this.fontWeight,
    this.size = 18,
    required this.color, 
    this.eGP='EGP'
    
  });
  
  final Color color;
  final String text;
  final String price;
  final FontWeight? fontWeight;
  final double size;
  final String eGP;
 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gap(20.w),
        CustomText(
          text: text,
          color: color,
          size: size,
          weight: fontWeight,
        ),
        Spacer(),
        CustomText(
          text: '$eGP $price',
          color: color,
          size: size,
          weight: fontWeight,
          
          
        ),
        Gap(20.w),
      ],
    );
  }
}
