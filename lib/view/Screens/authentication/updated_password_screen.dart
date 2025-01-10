import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../controllers/utils/app_textstyles.dart';

import '../widgets/custom_button.dart';
import 'login_screen.dart';

class UpdatedPasswordScreen extends StatelessWidget {
  const UpdatedPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: mediaQuerySize.height*0.03.h,horizontal: mediaQuerySize.width*0.08.w),
       
        child: Column(
          children: [
            SizedBox(
              height: mediaQuerySize.height * 0.06.h,
            ),
            Center(
                child: Text(
              'Successfully',
              style: AppTextstyles.BoldBlackText()
            )),
            SizedBox(
              height: mediaQuerySize.height * 0.02.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:  mediaQuerySize.width*0.03.w, vertical: mediaQuerySize.height*0.02.h),
              child: Center(
                child: Text(
                  'Your password has been updated, please change your password regularly to avoid this happening ',
                  style: AppTextstyles.simpleGreyText()
                 // style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.03.h,
            ),
            CustomButton(
              onTap: () {
                Get.to(() => LoginScreen());
              },
              name: 'Back To Profile',
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
