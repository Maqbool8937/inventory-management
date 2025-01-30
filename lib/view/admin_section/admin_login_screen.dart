import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/view/Screens/authentication/forgot_password.dart';
import 'package:inventory_management_app/view/Screens/authentication/sign_up_screen.dart';
import 'package:inventory_management_app/view/Screens/bottom_navigation_bar.dart';

import '../../../controllers/getxControllers/auth_controllers.dart';
import '../../../controllers/utils/app_extension.dart';
import '../../../controllers/utils/app_textstyles.dart';
import '../Screens/authentication/back_to_home_screen.dart';
import '../Screens/widgets/custom-field.dart';
import '../Screens/widgets/custom_button.dart';



class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<AdminLoginScreen> {

  GlobalKey<FormState> formKey = GlobalKey();
AuthControllers authControllers = Get.put(AuthControllers());
final TextEditingController emailControler = TextEditingController();

final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.05.w, vertical: mediaQuerySize.height * 0.01.h),
              child: Column(
                children: [
                  SizedBox(
                    height: mediaQuerySize.height * 0.08.h,
                  ),
                  Center(child: Text('Welcome Back', style: AppTextstyles.BoldBlackText())),
                  SizedBox(
                    height: mediaQuerySize.height * 0.02.h,
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.03.h,
                  ),
                  CustomField(
                    controller: emailControler,
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
                  CustomField(
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
                  SizedBox(
                    height: mediaQuerySize.height * 0.03.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle_outlined,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Remember Password', style: AppTextstyles.SimpleBlackText()),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => ForgotPasswordScreen());
                          },
                          child: Text('Forget Password?', style: AppTextstyles.SimpleBlackText())),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.03.h,
                  ),
                  CustomButton(
                    isLoading: authControllers.isLoading.value,
                    name: 'Login',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                       Get.offAll(() => BackToProfile.BackToHomeScreen());
                        // await authControllers
                        //     .signInWithEmailAndPassword(
                        //   email: emailControler.text.trim(),
                        //   password: passwordController.text.trim(),
                        // )
                        //     .then(
                        //   (value) {
                        //     if (value == true) {
                        //       //return Get.to(() => ImageScreen());
                        //     } else {
                        //       print('the error');
                        //     }
                        //   },
                        // );

                        // Get.to(() => ForgotPasswordScreen());
                      }
                      print('no');
                    },
                  ),
                  
                ],
              ),
            ),
          )),
        ),
      );
    });
  }
}
