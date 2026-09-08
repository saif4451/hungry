import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/product/widget/spicy_slider.dart';
import '../widget/topping_card.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
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
                      // top bar / spicy slider
                      SpicySlider(
                        value: value,
                        onChanged: (v) {
                          setState(() {
                            value = v;
                          });
                        },
                      ),
                      Gap(32.h),

                      CustomText(text: 'Toppings', size: 18.sp),
                      Gap(12.h),

                      // toppings list
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: List.generate(4, (index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: ToppingCard(
                                image: 'assets/top${index + 1}.png',
                                title: food[index],
                              ),
                            );
                          }),
                        ),
                      ),
                      Gap(24.h),

                      CustomText(text: 'Side options', size: 18.sp),
                      Gap(12.h),


                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: List.generate(4, (index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: ToppingCard(
                                image: 'assets/top${index + 1}.png',
                                title: food[index],
                              ),
                            );
                          }),
                        ),
                      ),
                      Gap(20.h),
                    ],
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.only(bottom: 16.h, top: 8.h),
                child: PriceBar(
                  customBtnHoreizentalPadding: 25,
                  total: total, // ربط بالمتغير Dynamic
                  customBtn: 'Add To Cart',
                  onBtnTap: () {
                    // إضافة إلى السلة
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