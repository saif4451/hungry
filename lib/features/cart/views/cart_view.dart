import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/cart/widgets/card_item.dart';
import 'package:hungry/shared/price_bar.dart';

import '../../checkout/view/chekout_view.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final int itemCount = 6;
  final double itemUnitPrice = 60;
  late List<int> counterMele;

  double get total {
    int totalItems = counterMele.fold(0, (sum, count) => sum + count);
    return totalItems * itemUnitPrice;
  }

  void onAdd(int index) {
    setState(() {
      counterMele[index]++;
    });
  }

  void onMinus(int index) {
    setState(() {
      if (counterMele[index] > 1) {
        counterMele[index]--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    counterMele = List.generate(itemCount, (_) => 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          // 1. الجزء الثابت فوق (PriceBar)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            height: 104.h,
            child: PriceBar(
              customBtnHoreizentalPadding: 25,
              total: total,
              customBtn: 'Check out',
              onBtnTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChekoutView()),
              ),
            ),
          ),
          Gap(10.h),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                bottom: 110.0.h,
                left: 14.w,
                right: 14.w,
              ),
              physics: const BouncingScrollPhysics(),

              itemCount: itemCount,
              separatorBuilder: (context, index) => Gap(12.h),
              itemBuilder: (context, index) {
                return CardItem(
                  onAddTap: () => onAdd(index),
                  onMinusTap: () => onMinus(index),
                  image: 'assets/test.png',
                  title: 'Hamburger',
                  des: 'Veggie Burger',
                  number: counterMele[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
