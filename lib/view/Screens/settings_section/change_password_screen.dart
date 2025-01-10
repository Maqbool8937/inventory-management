import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/view/Screens/authentication/forgot_password.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

import '../authentication/login_screen.dart';
import '../widgets/common_appbar.dart';
import '../widgets/custom-field.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
          padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03.h, horizontal: mediaQuerySize.width * 0.03.w),
          child: Column(children: [
            SizedBox(
              height: mediaQuerySize.height * 0.03.h,
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.05.h,
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
              height: mediaQuerySize.height * 0.05.h,
            ),
            CustomButton(
              name: 'Change Password',
              onTap: () {
                Get.to(() => ForgotPasswordScreen(
                      isChangePassword: true,
                    ));
              },
            )
          ]),
        ))));
  }
}
