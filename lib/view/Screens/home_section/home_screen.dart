import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/dashboard_controller.dart';
import 'package:inventory_management_app/view/Screens/battery_screen_2.dart';
import 'package:inventory_management_app/view/Screens/road_side_services.dart';
import 'package:inventory_management_app/view/Screens/truck_stock_section/battery_search_screen.dart';
import 'package:inventory_management_app/view/Screens/truck_stock_section/truck_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_drawer.dart';
import '../widgets/common_appbar.dart';
import '../widgets/common_mid_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final DashboardController dashboardController = Get.put(DashboardController());

  final Map<String, Widget Function()> routes = {
    'BatteryScreen2': () => BatteryScreen2(),
    'RoadSideServices': () => RoadSideServices(),
    'BatterySearchScreen': () => BatterySearchScreen(),
    'TruckScreen': () => TruckScreen(),
    'IssuesScreen': () => TruckScreen(),
    'BatterySearchScreen': () => BatterySearchScreen(),
    'RoadSideServices': () => RoadSideServices(),
   
  };

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        drawer: CustomDrawer(),
        appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
        body: Obx(() {
          if (dashboardController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              SizedBox(height: mediaQuerySize.height * 0.03.h),
              CommonMidWidget(),
              SizedBox(height: mediaQuerySize.height * 0.03.h),
              const Text('Dashboard', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: mediaQuerySize.height * 0.03.h),

              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5, // Increased width, reduced height
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: dashboardController.dashboardItems.length,
                  itemBuilder: (context, index) {
                    final item = dashboardController.dashboardItems[index];

                    return GestureDetector(
                      onTap: () {
                        if (routes.containsKey(item.route)) {
                          Get.to(routes[item.route]!());
                        }
                      },
                      child: Container(
                        height: mediaQuerySize.height * 0.12.h, // Decreased height
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: const Color(0xffFAF7F8),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 1)],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(item.image, height: 40, width: 40), // Adjusted image size
                            const SizedBox(width: 10), // Horizontal spacing
                            Expanded(
                              child: Text(
                                item.title,
                                textAlign: TextAlign.left,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis, // Prevents overflow issues
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // SizedBox(height: mediaQuerySize.height*0.02.h,),
              // ElevatedButton(onPressed: (){
              //    dashboardController .addDashboardItems();
              // }, child: Text('Add'))
            ],
          );
        }),
      ),
    );
  }
}
