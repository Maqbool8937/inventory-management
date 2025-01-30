import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/battery_screen_3.dart';
import 'package:inventory_management_app/view/Screens/transfer_section/scan_image.dart';
import 'package:inventory_management_app/view/Screens/transfer_section/transfer_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

class BatteryScreen2 extends StatelessWidget {
  BatteryScreen2({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SafeArea(
        child: Container(
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
                  Image.asset(
                    'assets/images/double_battery.png',
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
                          CustomField(
                            text: 'Call ID',
                          ),
                          SizedBox(
                            height: mediaQuerySize.height * 0.02,
                          ),
                          CustomField(
                            isSuffixIcon: true,
                           // suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                            text: 'Battery Size',
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.02,
                  ),
                  CustomButton(
                    onTap: () {
                      Get.to(() => ScanImage());
                    },
                    name: 'Scan Battery',
                    width: mediaQuerySize.width,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.02,
                  ),
                  Text(
                    'Input Amount',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                          CustomField(
                            text: 'Amount',
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.02,
                  ),
                  Container(
                    width: mediaQuerySize.width.w,
                    decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColors.gredientColor1, AppColors.gredientColor2]), color: AppColors.primaryColor, borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03, horizontal: mediaQuerySize.width * 0.01),
                    child: Column(
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: mediaQuerySize.height * 0.015.h,
                        ),
                        Text(
                          '\$234.67',
                          style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: mediaQuerySize.height * 0.015.h,
                        ),
                        CustomButton(
                          onTap: () {
                            Get.to(() => BatteryScreen3());
                          },
                          borderColor: AppColors.whiteColor,
                          isEnabled: true,
                          name: 'Complete Payment',
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          height: mediaQuerySize.height * 0.015.h,
                        ),
                        Text(
                          'plus tax, plus service charges',
                          style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.015.h,
                  ),
                  Text('Or'),
                  SizedBox(
                    height: mediaQuerySize.height * 0.015.h,
                  ),
                  CustomButton(
                    onTap: () {
                      Get.to(() => TransferScreenOne());
                    },
                    width: mediaQuerySize.width,
                    name: 'Transfer',
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
