import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/product/widget/spicy_slider.dart';
import 'package:hungry/features/product/widget/topping_card.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/price_bar.dart';
class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double total = 18.19;
  final food = ['Tomato', 'Onions', 'Pickles', 'Bacons'];
  double value = 0.3;
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
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top bar
            SpicySlider(
              value: value,
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              },
            ),
            Gap(50.h),

            CustomText(text: 'Toppings', size: 20.sp),
            Gap(10.h),
            // toopings
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: ToppingCard(
                      image: 'assets/top${index + 1}.png',
                      title: food[index],
                    ),
                  );
                }),
              ),
            ),
            Gap(22.h),

            CustomText(text: 'Side options', size: 20.sp),
            Gap(10.h),
            //side option
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: ToppingCard(
                      image: 'assets/top${index + 1}.png',
                      title: food[index],
                    ),
                  );
                }),
              ),
            ),

            Spacer(),

            // price bar
            PriceBar(total: 19.4, customBtn: 'Add To Cart'),

            Gap(55.h),
          ],
        ),
      ),
    );
  }
}
