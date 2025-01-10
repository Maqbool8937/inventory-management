import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/getxControllers/auth_controllers.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/road_side_services.dart';
import 'package:inventory_management_app/view/Screens/battery_screen_2.dart';
import 'package:inventory_management_app/view/Screens/truck_stock_section/battery_search_screen.dart';
import 'package:inventory_management_app/view/Screens/truck_stock_section/truck_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_mid_widget.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_drawer.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> images = [
    'assets/images/battery_icon.png',
    'assets/images/road_side_icon.png',
    'assets/images/issue_icon.png',
    'assets/images/receive_icon.png',
    'assets/images/truck_stock_icon.png',
    'assets/images/battery_search_icon.png',
    'assets/images/delivery_icon.png',
  ];

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(),
        appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
        body: Container(
          height: mediaQuerySize.height.h,
          width: mediaQuerySize.width.w,
          color: AppColors.whiteColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: mediaQuerySize.height * 0.035.h),
                CommonMidWidget(),
                SizedBox(height: mediaQuerySize.height * 0.035.h),
                const Text('Dashboard'),
                SizedBox(height: mediaQuerySize.height * 0.035.h),
                Wrap(
                  children: List.generate(
                    title.length,
                    (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02.w, vertical: mediaQuerySize.height * 0.015),
                        child: GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              Get.to(() => BatteryScreen2());
                            }
                            if (index == 1) {
                              Get.to(() => RoadSideServices());
                            }

                            if (index == 4) {
                              Get.to(() => TruckScreen());
                            }
                            if (index == 5) {
                              Get.to(() => BatterySearchScreen());
                            }
                          },
                          child: Container(
                              width: mediaQuerySize.width * 0.4,
                              // height: mediaQuerySize.height * 0.01,
                              decoration: BoxDecoration(boxShadow: [const BoxShadow(color: Colors.black12, blurRadius: 1, spreadRadius: 1, offset: Offset(0, 0))], color: AppColors.secondoryColor, borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.045, vertical: mediaQuerySize.height * 0.03),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(images[index]),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: mediaQuerySize.width * 0.2,
                                          height: mediaQuerySize.height * 0.05,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              title[index],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> title = ['Battery', 'Roadside Service', 'Issue', 'Recieve', 'Truck Stock', 'Battery Search', 'Delivery'];
}
