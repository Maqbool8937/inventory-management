import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inventory_management_app/view/Screens/authentication/login_screen.dart';
import '../../../controllers/utils/app_extension.dart';
import '../../../controllers/utils/app_textstyles.dart';
import '../widgets/custom-field.dart';
import '../widgets/custom_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final bool isChangePassword;
  ForgotPasswordScreen({super.key, this.isChangePassword = false});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final RxBool isLoading = false.obs;

  Future<void> resetPassword() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      Get.snackbar("Success", "Password reset link sent to your email.", snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: mediaQuerySize.height * 0.015.h,
            horizontal: mediaQuerySize.width * 0.03.w,
          ),
          child: Form(
            key: formKey,
            child: Obx(() => SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: mediaQuerySize.height * 0.06.h),
                  Center(child: Text('Forgot Password', style: AppTextstyles.BoldBlackText())),
                  SizedBox(height: mediaQuerySize.height * 0.02.h),
                  Text(
                    'Enter your Email Address to receive a password reset link.',
                    textAlign: TextAlign.center,
                    style: AppTextstyles.SimpleBlackText(),
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.03.h),
                  CustomField(
                    controller: emailController,
                    text: 'Email',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!AppExtension.emailExtension.hasMatch(value.trim())) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.03.h),
                  CustomButton(
                    width: mediaQuerySize.width * 0.9.w,
                    name: 'Send Reset Link',
                    isLoading: isLoading.value,
                    onTap: resetPassword,
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.03.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Remember Password?', style: AppTextstyles.simpleGreyText()),
                      TextButton(
                        onPressed: () => Get.to(() => LoginScreen()),
                        child: Text('Log in', style: AppTextstyles.simpleRedText()),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
