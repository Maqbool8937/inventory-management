import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:inventory_management_app/view/Screens/payment_screen.dart';
import 'package:inventory_management_app/view/Screens/request_transfer_screen.dart';
import 'package:inventory_management_app/view/Screens/road_side_services.dart';
import 'package:inventory_management_app/view/Screens/road_side_services_2.dart';
import 'package:inventory_management_app/view/Screens/road_side_services_3.dart';
import 'package:inventory_management_app/view/Screens/transfer_screen.dart';

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
      child: GetMaterialApp(debugShowCheckedModeBanner: false, home: RoadSideServices3()),
    );
  }
}
