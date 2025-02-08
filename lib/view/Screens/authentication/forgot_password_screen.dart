import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../controllers/auth_controllers.dart';
import '../../../controllers/utils/app_extension.dart';
import '../../../controllers/utils/app_textstyles.dart';

import '../widgets/customField.dart';
import '../widgets/custom_button.dart';
import 'back_to_profile.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  AuthControllers authControllers = Get.put(AuthControllers());
  TextEditingController emailresetController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.015.h, horizontal: mediaQuerySize.width * 0.03.w),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuerySize.height * 0.06.h,
                ),
                Center(child: Text('Forgot Password', style: AppTextstyles.BoldBlackText())),
                SizedBox(
                  height: mediaQuerySize.height * 0.02.h,
                ),
                Text('Enter your Email Address to receive ', style: AppTextstyles.SimpleBlackText()),
                SizedBox(
                  height: mediaQuerySize.height * 0.01.h,
                ),
                Text('a password reset link. ', style: AppTextstyles.SimpleBlackText()),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
                  controller: emailresetController,
                  text: 'Email',
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
                Obx(() {
                  return CustomButton(
                    name: 'Send Reset Link',
                    isLoading: authControllers.isLoading.value,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        Get.to(() => BackToProfile());
                        
                      }
                    },
                  );
                }),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Remember Password?', style: AppTextstyles.simpleGreyText()),
                    Row(
                      children: [
                        Text('  Back to', style: AppTextstyles.simpleGreyText()),
                        TextButton(
                            onPressed: () {
                            //  Get.to(() => LoginScreen());
                            },
                            child: Text('Log in', style: AppTextstyles.simpleRedText()))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
