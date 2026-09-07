import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/root.dart';

void main() {
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
          home: Root(),
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        );
      },
    );
  }
}
