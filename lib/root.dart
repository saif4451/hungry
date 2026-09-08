import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/cart/views/cart_view.dart';
import 'package:hungry/features/home/views/home_view.dart';
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
    controller = PageController(initialPage: currentScreen);
    screens = [HomeView(), CartView(), OrderHistory(), SettingView()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(80),
        ),
        child: navigationBar(),
      ),
    );
  }

  BottomNavigationBar navigationBar() {
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
      unselectedItemColor: Colors.grey.shade500,
      items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: 'Cart'),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_restaurant_sharp),
          label: 'Order History',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings),
          label: 'Setting',
        ),
      ],
    );
  }
}
