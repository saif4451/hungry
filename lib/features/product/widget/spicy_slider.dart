import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  const SpicySlider({super.key, required this.value, required this.onChanged});
  final double value;
  final ValueChanged<double> onChanged;

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/food_details.png', height: 250.h),
        Gap(18.w),
        Column(
          children: [
            CustomText(
              text:
                  'Customize Your Burger\n to Your Tastes.\n Ultimate Experience',
            ),
            Gap(35.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),

                // ignore: deprecated_member_use
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department_rounded,
                            color: Colors.red,
                            size: 22.sp,
                          ),
                          Gap(6.w),
                          Text(
                            'Spice Level',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(6.w),
                        ],
                      ),

                      Text(
                        '${(widget.value * 5).round()}/5',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Gap(8.h),

                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 7.h,

                      activeTrackColor: Colors.red,

                      inactiveTrackColor: Colors.red.shade100,

                      thumbColor: Colors.white,

                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 10.r,
                        elevation: 4,
                      ),

                      // ignore: deprecated_member_use
                      overlayColor: Colors.red.withOpacity(0.12),

                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 20.r,
                      ),
                    ),

                    child: Slider(
                      value: widget.value,
                      onChanged: widget.onChanged,
                      min: 0,
                      max: 1,
                    ),
                  ),
                ],
              ),
            ),

            Row(children: [Gap(100.w)]),
          ],
        ),
      ],
    );
  }
}
