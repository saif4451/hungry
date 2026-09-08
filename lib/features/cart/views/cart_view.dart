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
  double total = 99.19;
  late List<int> counterMele;

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
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverGap(20.h),

              SliverList.separated(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return CardItem(
                    onAddTap: () {
                      onAdd(index);
                    },
                    onMinusTap: () {
                      onMinus(index);
                    },
                    image: 'assets/test.png',
                    title: 'Hamburger',
                    des: 'Veggie Burger',
                    number: counterMele[index],
                  );
                },
                separatorBuilder: (context, index) => Gap(10.h),
              ),

              SliverGap(20.h),

              SliverToBoxAdapter(
                child: PriceBar(
                  customBtnFontSize: 16,
                  total: 99.19,
                  customBtn: 'Checkout',
                  onBtnTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChekoutView()),
                  ),
                  customBtnHoreizentalPadding: 36,
                  customBtnVerticalPadding: 21,
                ),
              ),

              SliverGap(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
