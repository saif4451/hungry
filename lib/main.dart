import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/auth/views/login_view.dart';
import 'package:hungry/features/splash/splash_screen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashView(),
          theme: ThemeData(
            splashColor: Colors.transparent,

            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(

              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              toolbarHeight: 45.h,
            ),
          ),
        );
      },
    );
  }
}
