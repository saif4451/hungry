import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/home/widgets/card_item.dart';
import 'package:hungry/features/home/widgets/category_home.dart';
import 'package:hungry/features/home/widgets/search.dart';
import 'package:hungry/features/home/widgets/user_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> catogery = ['All', 'Combos', 'Sliders', 'Classic'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            //App bar
            SliverAppBar(
              elevation: 0,
              pinned: true,
              floating: false,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              toolbarHeight: 200.h,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Expanded(
                  child: Column(
                    children: [
                      Gap(40.h),
                      UserHeader(),
                      Gap(30.h),
                      Search(),
                      Gap(10.h),
                    ],
                  ),
                ),
              ),
            ),

            //  category
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 15.w, left: 15.w, bottom: 15.h),
                child: CategoryHome(
                  selectedIndex: selectedIndex,
                  catogery: catogery,
                ),
              ),
            ),

            // Grid View
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(childCount: 6, (
                  context,
                  index,
                ) {
                  return CardItem(
                    image: 'assets/sw${index + 1}.png',
                    text: 'Cheeseburger',
                    des: 'Wendy\'s Burger',
                    rate: '4.9',
                  );
                }),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 4.w,
                  crossAxisCount: 2,
                  childAspectRatio: 0.7.h,
                  mainAxisSpacing: 4.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
