import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/utils/app_extension.dart';
import '../../../controllers/utils/app_textstyles.dart';

import '../widgets/customField.dart';
import '../widgets/custom_button.dart';
import 'back_to_profile.dart';

class ChangePasswordFromlink extends StatelessWidget {
  ChangePasswordFromlink({super.key});
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.04.w, vertical: mediaQuerySize.height * 0.03.h),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: mediaQuerySize.height * 0.06.h,
              ),
              Center(
                  child: Text(
                'Change Password',
                style: AppTextstyles.BoldBlackText(),
              )),
              SizedBox(
                height: mediaQuerySize.height * 0.02.h,
              ),
              Text('Enter your Email Address to receive ', style: AppTextstyles.simpleGreyText()),
              SizedBox(
                height: mediaQuerySize.height * 0.01.h,
              ),
              Text('a password reset link. ', style: AppTextstyles.simpleGreyText()),
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              CustomField(
                text: 'Email Address',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the email field';
                  }

                  if (!AppExtension.emailExtension.hasMatch(value.trim())) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              CustomButton(
                width: mediaQuerySize.width * 0.9,
                name: 'Send Reset Link',
                onTap: () {
                  if (formKey.currentState!.validate() ?? false) {
                    Get.to(() => BackToProfile());
                  }
                },
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Remember Password?', style: AppTextstyles.simpleGreyText()),
                  Row(
                    children: [Text('  Back to', style: AppTextstyles.simpleGreyText()), TextButton(onPressed: () {}, child: Text('Log in', style: AppTextstyles.simpleRedText()))],
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
