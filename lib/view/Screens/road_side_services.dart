import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/view/Screens/road_side_services_2.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';

// ignore: must_be_immutable
class RoadSideServices extends StatelessWidget {
  RoadSideServices({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> titles = [
    'Flat tyre',
     'Inbound Release', 
     'Tow', 'Gas', 
     'Jump Start',
      'Mechanic',
       'Lockout',
        'More'];
  List<String> images = [
    'assets/images/tyre_icon.png',
     'assets/images/car_icon.png',
      'assets/images/tow-truck_icon.png',
       'assets/images/gas-pump_icon.png',
        'assets/images/jump-start_icon.png', 
        'assets/images/mechanic_icon.png', 
        'assets/images/lockout_icon.png',
         'assets/images/more_icon.png'];
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03.w, vertical: mediaQuerySize.height * 0.01.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuerySize.height * 0.035.h,
                ),
                Text(
                  'Roadside Services',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.02,
                ),
                Wrap(
                    children: List.generate(
                  titles.length,
                  (index) => GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Get.to(() => RoadSideServices2());
                      }
                    },
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02, vertical: mediaQuerySize.height * 0.01),
                        child: SizedBox(
                          height: mediaQuerySize.height * 0.13,
                          width: mediaQuerySize.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(images[index]),
                              Text(
                                maxLines: 2,
                                titles[index],
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
