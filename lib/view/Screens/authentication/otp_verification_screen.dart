import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/view/Screens/authentication/back_to_login.dart';

import '../../../controllers/getxControllers/otp_verification_controller.dart';
import '../../../controllers/utils/app_colors.dart';
import '../../../controllers/utils/app_textstyles.dart';

import '../widgets/arrow_back_button.dart';
import '../widgets/custom_button.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key});

  final VerificationController controller = Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.02.h, horizontal: mediaQuerySize.width * 0.03.w),
          child: Column(
            children: [
              ArrowBackButton(backgroundColor: Colors.black.withOpacity(0.07)),
              SizedBox(height: mediaQuerySize.height * 0.06.h),
              Center(
                child: Text('Verification Code', style: AppTextstyles.BoldBlackText()),
              ),
              SizedBox(height: mediaQuerySize.height * 0.02),
              Text('Enter your Email Address to receive ', style: AppTextstyles.simpleGreyText()),
              SizedBox(height: mediaQuerySize.height * 0.01),
              Text('email address.', style: AppTextstyles.simpleGreyText()),
              SizedBox(height: mediaQuerySize.height * 0.03.h),
              OtpTextField(
                borderRadius: BorderRadius.circular(15),
                numberOfFields: 4,
                fieldWidth: 55,
                borderColor: const Color(0xFF512DA8),
                focusedBorderColor: AppColors.buttonColor,
                cursorColor: Colors.blue,
                showFieldAsBox: true,
                margin: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02.w), 
                onCodeChanged: (String code) {
                 
                },
                onSubmit: (String verificationCode) {},
              ),
              SizedBox(height: mediaQuerySize.height * 0.04.h),
              CustomButton(
                width: mediaQuerySize.width * 0.8.w,
                name: 'Confirm',
                onTap: () {
                  Get.to(() => BackToProfile());
                },
              ),
              SizedBox(height: mediaQuerySize.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
