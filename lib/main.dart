import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_theme.dart';
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
          theme: AppTheme.appTheme,
        );
      },
    );
  }
}
