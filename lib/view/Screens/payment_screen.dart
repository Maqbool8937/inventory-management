import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context),
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
                CustomButton(width: mediaQuerySize.width, name: 'Tap to Change'),
                SizedBox(
                  height: mediaQuerySize.height * 0.02,
                ),
                Text('Or'),
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
                CustomButton(width: mediaQuerySize.width, name: 'Pay'),
                SizedBox(
                  height: mediaQuerySize.height * 0.02,
                ),
                CustomButton(
                  borderColor: AppColors.primaryColor,
                  color: Colors.transparent,
                  width: mediaQuerySize.width,
                  name: 'Skip Payment',
                  textStyle: TextStyle(color: AppColors.primaryColor, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
