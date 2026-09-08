import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class CategoryHome extends StatelessWidget {
  const CategoryHome({
    super.key,
    required this.selectedIndex,
    required this.catogery,
    this.onCategorySelected,
  });

  final int selectedIndex;
  final List<String> catogery;
  final ValueChanged<int>? onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(catogery.length, (index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              if (onCategorySelected != null) {
                onCategorySelected!(index);
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : const Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(20.r), // استخدام r للتجاوب
              ),
              child: CustomText(
                text: catogery[index],
                size: 14.sp,
                weight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          );
        }),
      ),
    );
  }
}