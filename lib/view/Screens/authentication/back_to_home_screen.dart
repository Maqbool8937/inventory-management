import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/view/Screens/home_section/home_screen.dart';

import '../../../controllers/utils/app_textstyles.dart';
import '../bottom_navigation_bar.dart';
import '../widgets/custom_button.dart';
import 'login_screen.dart';

class BackToProfile extends StatelessWidget {
  const BackToProfile.BackToHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03.h, horizontal: mediaQuerySize.width * 0.02.w),
        child: Column(
          children: [
            SizedBox(
              height: mediaQuerySize.height * 0.06.h,
            ),
            Center(child: Text('Successfully', style: AppTextstyles.BoldBlackText())),
            SizedBox(
              height: mediaQuerySize.height * 0.015.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.09.w, vertical: mediaQuerySize.height * 0.02.h),
              child: Center(
                child: Text(textAlign: TextAlign.center, 'Your password has been updated, please change your password regularly to avoid this happening ', style: AppTextstyles.simpleGreyText()),
              ),
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.03.h,
            ),
            CustomButton(
              onTap: () {
               Get.offAll(() => BottomNavigationBarScreen());

              },
              name: 'Continue',
              width: mediaQuerySize.width * 0.9.w,
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.03.h,
            ),
          ],
        ),
      )),
    );
  }
}
