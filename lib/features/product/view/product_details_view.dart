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
  double total = 20;
  final food = ['Tomato', 'Onions', 'Pickles', 'Becons'];
  double value = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
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
                              padding: EdgeInsets.only(right: 14.w),
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

                      Gap(130.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        height: 130.h,
        child: PriceBar(
          customBtnHoreizentalPadding: 25,
          total: total,
          customBtn: 'Add To Cart',
          onBtnTap: () {

          },
        ),
      ),
    );
  }
}