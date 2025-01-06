import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: mediaQuerySize.height.h,
          width: mediaQuerySize.width.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03.w, vertical: mediaQuerySize.height * 0.01.h),
            child: Column(
              children: [
                CommonAppBar(),
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
                          suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
