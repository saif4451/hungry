import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class ToppingCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onAdd;

  const ToppingCard({
    super.key,
    required this.image,
    required this.title,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,

      shadowColor: AppColors.greyColor,
      borderRadius: BorderRadius.circular(32.r),

      child: Container(
        width: 115.w,
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          color: Colors.white,
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Image.asset(image, fit: BoxFit.contain),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF3D3232),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),

                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Tomato',
                      color: Colors.white,
                      size: 15.sp,
                      weight: FontWeight.w600,
                    ),
                    Spacer(),

                    GestureDetector(
                      onTap: onAdd,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF3344),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 20.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
