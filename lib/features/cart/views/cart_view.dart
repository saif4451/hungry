import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/cart/widgets/card_item.dart';
import 'package:hungry/features/checkout/view/chekout_view.dart';
import 'package:hungry/shared/price_bar.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final int itemCount = 4;
  final double itemUnitPrice = 24.80;
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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverGap(12.h),

          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverList.separated(
              itemCount: itemCount,
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
              separatorBuilder: (context, index) => Gap(12.h),
            ),
          ),

          SliverGap(24.h),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: PriceBar(
                customBtnFontSize: 18.sp,
                total: total,
                customBtn: 'Checkout',
                onBtnTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChekoutView()),
                ),
                customBtnHoreizentalPadding: 30.w,
                customBtnVerticalPadding: 18.h,
              ),
            ),
          ),

          SliverGap(100.h),
        ],
      ),
    );
  }
}