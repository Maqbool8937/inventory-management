import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:inventory_management_app/view/Screens/home_section/home_screen.dart';

import 'view/Screens/authentication/forgot_password.dart';
import 'view/Screens/authentication/login_screen.dart';
import 'view/Screens/authentication/otp_verification_screen.dart';
import 'view/Screens/authentication/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: Size(mediaQuerySize.width, mediaQuerySize.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child:  GetMaterialApp(debugShowCheckedModeBanner: false, home: OtpVerificationScreen()),
    );
  }
}
