import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/home/widgets/card_item.dart';
import 'package:hungry/features/home/widgets/category_home.dart';
import '../widgets/search.dart';
import 'package:hungry/features/home/widgets/user_header.dart';
import 'package:hungry/features/product/view/product_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> catogery = const ['All', 'Combos', 'Sliders', 'Classic'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Column(
                    children: [
                      const UserHeader(),
                      Gap(16.h),
                      const Search(),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: CategoryHome(
                    selectedIndex: selectedIndex,
                    catogery: catogery,
                    onCategorySelected: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),

              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 6,
                        (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductDetailsView(),
                            ),
                          );
                        },
                        child: CardItem(
                          image: 'assets/sw${index + 1}.png',
                          text: 'Cheeseburger',
                          des: 'Wendy\'s Burger',
                          rate: '4.9',
                        ),
                      );
                    },
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 0.70,
                  ),
                ),
              ),

              SliverGap(100.h),
            ],
          ),
        ),
      ),
    );
  }
}