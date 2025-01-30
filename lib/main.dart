import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:inventory_management_app/view/Screens/authentication/sign_up_screen.dart';
import 'package:inventory_management_app/view/Screens/bottom_navigation_bar.dart';
import 'package:inventory_management_app/view/Screens/battery_screen_3.dart';
import 'package:inventory_management_app/view/Screens/battery_and_road_screen_4.dart';
import 'package:inventory_management_app/view/Screens/road_side_services.dart';
import 'package:inventory_management_app/view/Screens/road_side_services_2.dart';
import 'package:inventory_management_app/view/Screens/road_side_services_3.dart';
import 'package:inventory_management_app/view/Screens/battery_screen_2.dart';

import 'view/Screens/check_status/check_status1_screen.dart';
import 'view/Screens/check_status/check_status2_screen.dart';
import 'view/Screens/station_truck_passcode_screen.dart';
import 'view/Screens/transfer_section/incoming_transfer_screen.dart';
import 'view/Screens/transfer_section/outcoming_transfer_screen.dart';
import 'view/Screens/transfer_section/scan_image.dart';
import 'view/Screens/transfer_section/transfer_screen.dart';
import 'view/Screens/truck_stock_section/battery_search_screen.dart';
import 'view/Screens/truck_stock_section/truck_screen.dart';

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
      child: GetMaterialApp(debugShowCheckedModeBanner: false, home: SignupScreen()),
    );
  }
}
