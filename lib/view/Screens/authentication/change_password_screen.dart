import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../controllers/auth_controllers.dart';

import '../widgets/customField.dart';
import '../widgets/custom_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  final AuthControllers passwordController = AuthControllers();
  final TextEditingController passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02.w, vertical: mediaQuerySize.height * 0.03.h),
                child: SingleChildScrollView(
                    child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: mediaQuerySize.height * 0.03.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/backButton.png',
                            fit: BoxFit.cover,
                          ),
                          CustomButton(
                            name: 'Personal Information',
                            width: mediaQuerySize.width * 0.6.w,
                          ),
                          Image.asset(
                            'assets/images/menu.png',
                            fit: BoxFit.contain,
                          )
                        ],
                      ),
                      SizedBox(
                        height: mediaQuerySize.height * 0.2.h,
                      ),
                      // Changing password text with toggle:
                      Obx(
                        () => CustomField(
                          text: 'Password',
                          controller: passwordFieldController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          isPasswordField: true,
                          isObscured: !passwordController.isPasswordVisible.value,
                          isSuffixIcon: true,
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordController.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: passwordController.togglePasswordVisibility,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: mediaQuerySize.height * 0.03.h,
                      ),
                      CustomButton(
                        width: mediaQuerySize.width * 0.9.w,
                        name: 'Change password',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            //  Get.to(() => VerificationCodeScreen());
                          }
                        },
                      ),
                    ],
                  ),
                )))));
  }
}
