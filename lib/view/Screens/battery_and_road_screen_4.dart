import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

class BatteryAndRoadScreen4 extends StatelessWidget {
  BatteryAndRoadScreen4({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
                  height: mediaQuerySize.height * 0.025.h,
                ),
                Image.asset(
                  'assets/images/double_battery.png',
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.02,
                ),
                Text(
                  'Transfer',
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
                          isSuffixIcon: true,
                          suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                          text: 'Battery Size',
                        ),
                        SizedBox(
                          height: mediaQuerySize.height * 0.02,
                        ),
                        CustomField(
                          isSuffixIcon: true,
                          suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                          text: 'Quantity',
                        ),
                        SizedBox(
                          height: mediaQuerySize.height * 0.02,
                        ),
                        CustomField(
                          text: 'Destination No.',
                        ),
                        SizedBox(
                          height: mediaQuerySize.height * 0.02,
                        ),
                        CustomField(
                          text: 'Track No.',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.02,
                ),
                CustomButton(width: mediaQuerySize.width, name: 'Request Transfer'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
