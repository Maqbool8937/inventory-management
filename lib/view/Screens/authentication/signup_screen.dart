import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../controllers/auth_controllers.dart';

import '../../../controllers/utils/app_extension.dart';
import '../../../controllers/utils/app_textstyles.dart';

import '../widgets/customField.dart';
import '../widgets/custom_button.dart';
import '../widgets/social_mediaicon_widget.dart';
import 'login_screen.dart';

// ignore: must_be_immutable
class SignupScreen extends StatefulWidget {
  bool isAdmin;
  SignupScreen({super.key, this.isAdmin = false});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
 AuthControllers authControllers = Get.put(AuthControllers());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.06.w, vertical: mediaQuerySize.height * 0.01.h),
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuerySize.height * 0.1.h,
                ),
                Center(child: Text('Create Your Account', style: AppTextstyles.BoldBlackText())),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
                  controller: fullNameController,
                  text: 'Full Name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter the following field';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
                  controller: phoneNumberController,
                  text: 'Phone Number',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter the phone number';
                    }
                    if (!AppExtension.phoneExtension.hasMatch(value.trim())) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomField(
                  controller: emailController,
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
                Obx(
                  () => CustomField(
                    text: 'Password',
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    isPasswordField: true,
                    isObscured: !authControllers.isPasswordVisible.value,
                    isSuffixIcon: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        authControllers.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: authControllers.togglePasswordVisibility,
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Obx(() {
                  return CustomButton(
                    name: 'Signup',
                    isLoading: authControllers.isLoading.value,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        // bool da = await authControllers.signUpwithEmailandPassword(
                        //   email: emailController.text.trim(),
                        //   password: passwordController.text.trim(),
                        //   collectionName: 'users',
                        //   fullName: fullNameController.text.trim(),
                        //   phoneNumber: phoneNumberController.text.trim(),
                        // );
                        // if (da) {
                        //   Get.to(() => RegisterSuccessfull());
                        // } else {
                        //   Get.snackbar('error', 'error');
                        // }
                      }
                    },
                  );
                }),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.01.w),
                      child: Text('Or With', style: AppTextstyles.simpleGreyText()),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.01.w, vertical: mediaQuerySize.height * 0.01.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaIconsRow(
                        imgUrl: 'assets/images/google3.png',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SocialMediaIconsRow(
                        imgUrl: 'assets/images/fb.png',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Row(
                  children: [
                    Text(' Already have an account?', style: AppTextstyles.simpleGreyText()),
                    TextButton(
                        onPressed: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Text('Log in', style: AppTextstyles.simpleRedText()))
                  ],
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.05,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
