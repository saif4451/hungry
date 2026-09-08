import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/auth/views/login_view.dart';
import 'package:hungry/features/setting/widgets/custom_btn_setting.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          children: [
            Spacer(),

            Row(
              children: [
                Expanded(
                  child: CustomBtnSetting(
                    text: 'Edit Profile',
                    icon: Icon(
                      CupertinoIcons.paintbrush_fill,
                      color: Colors.white,
                    ),
                    onTap: () {},
                  ),
                ),
                Gap(10.w),
                Expanded(
                  child: CustomBtnSetting(
                    text: 'Log out',
                    icon: Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                      
                    ),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginView()),
                        (route) => false,
                      );
                    },
                  ),
                ),
              ],
            ),
            Gap(30.h)
          ],
        ),
      ),
    );
  }
}
