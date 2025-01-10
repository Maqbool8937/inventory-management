import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/battery_and_road_screen_4.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_drawer.dart';

class RoadSideServices3 extends StatelessWidget {
  RoadSideServices3({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
        drawer: CustomDrawer(),
        body: Container(
          height: mediaQuerySize.height.h,
          width: mediaQuerySize.width.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03.w, vertical: mediaQuerySize.height * 0.01.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: mediaQuerySize.height * 0.025.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/battery_icon.png'),
                      Text(
                        'Flat tyre',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.025.h,
                  ),
                  CustomButton(
                    onTap: () {
                      Get.to(() => BatteryAndRoadScreen4());
                    },
                    name: 'Tap to Charge',
                    width: mediaQuerySize.width,
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.02,
                  ),
                  Text('Or'),
                  SizedBox(
                    height: mediaQuerySize.height * 0.02,
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.02,
                  ),
                  Card(
                    shadowColor: Colors.black,
                    elevation: 10,
                    borderOnForeground: true,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.aspectRatio * 0.01.w, vertical: mediaQuerySize.height * 0.02.h),
                      child: Column(
                        children: [
                          Text(
                            'Invoice Information',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.02,
                          ),
                          CustomField(
                            text: 'Full Name',
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.02,
                          ),
                          CustomField(
                            text: 'Card Number',
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.02,
                          ),
                          CustomField(
                            text: 'Expiration Date',
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.02,
                          ),
                          CustomField(
                            text: 'CVV',
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.02,
                          ),
                          CustomField(
                            text: 'Address',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.02,
                  ),
                  CustomButton(name: 'Pay'),
                  SizedBox(
                    height: mediaQuerySize.height * 0.02,
                  ),
                  CustomButton(
                    name: 'Skip Payment',
                    borderColor: AppColors.primaryColor,
                    color: Colors.transparent,
                    textStyle: TextStyle(color: AppColors.primaryColor),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
