import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

// ignore: must_be_immutable
class CategoryHome extends StatefulWidget {
  CategoryHome({
    super.key,
    required this.selectedIndex,
    required this.catogery,
  });
  late int selectedIndex;
  final List catogery;

  @override
  State<CategoryHome> createState() => _CategoryHomeState();
}

class _CategoryHomeState extends State<CategoryHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.catogery.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: widget.selectedIndex == index
                    ? AppColors.primaryColor
                    : Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              child: CustomText(
                text: widget.catogery[index],
                size: 16,
                weight: FontWeight.w600,
                color: widget.selectedIndex == index ? Colors.white : null,
              ),
            ),
          );
        }),
      ),
    );
  }
}
