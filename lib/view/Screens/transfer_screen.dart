import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
