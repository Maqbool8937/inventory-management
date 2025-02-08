import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../controllers/utils/app_textstyles.dart';

import '../widgets/custom_button.dart';

class BackToProfile extends StatelessWidget {
  const BackToProfile({super.key});

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
                child: Text('Your password has been updated, please change your password regularly to avoid this happening ', style: AppTextstyles.simpleGreyText()),
              ),
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.03.h,
            ),
            CustomButton(
              onTap: () {
                // Get.to(() => LoginScreen());
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
