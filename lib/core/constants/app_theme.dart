import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
    errorStyle: TextStyle(
      color: Colors.white,
    ),
  ),

    splashColor: Colors.transparent,

    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 45.h,
      
    ),
  );
}
