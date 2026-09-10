import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/cart/views/cart_view.dart';
import 'features/home/views/home_view.dart';
import 'package:hungry/features/orderHistory/views/order_history.dart';
import 'package:hungry/features/setting/view/setting_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller;
  late List<Widget> screens;
  int currentScreen = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentScreen);
    screens = const [
      HomeView(),
      CartView(),
      OrderHistory(),
      SettingView(),
    ];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBody: true,
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: SafeArea(
          bottom: true,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 8.h,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: navigationBar(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget navigationBar() {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      enableFeedback: true,
      currentIndex: currentScreen,
      onTap: (index) {
        setState(() {
          currentScreen = index;
          controller.jumpToPage(currentScreen);
        });
      },
      elevation: 0,
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey.shade400,
      iconSize: 22.sp,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_restaurant_sharp),
          label: 'Order History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Setting',
        ),
      ],
    );
  }
}