import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:inventory_management_app/view/Screens/add_new_screen/add_new_screen.dart';
import 'package:inventory_management_app/view/Screens/approval_screen/approval_screen.dart';
import 'package:inventory_management_app/view/Screens/home_section/home_screen.dart';
import 'package:inventory_management_app/view/Screens/login_section/Login2.dart';
import 'package:inventory_management_app/view/Screens/login_section/login_screen.dart';

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
      child: GetMaterialApp(debugShowCheckedModeBanner: false, home: Login2()),
    );
  }
}
