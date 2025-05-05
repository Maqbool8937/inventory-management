import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/auth_controllers.dart';
import 'package:inventory_management_app/view/Screens/authentication/forgot_password.dart';
import 'package:inventory_management_app/view/Screens/authentication/signup_screen.dart';
import 'package:inventory_management_app/view/Screens/bottom_navigation_bar.dart';

import '../../../controllers/utils/app_extension.dart';
import '../../../controllers/utils/app_textstyles.dart';
import '../../admin_section/admin_login_screen.dart';
import '../widgets/custom-field.dart';
import '../widgets/custom_button.dart';
import '../widgets/social_media_icons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final AuthControllers authControllers = Get.put(AuthControllers());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQuerySize.width * 0.05,
                  vertical: mediaQuerySize.height * 0.01),
              child: Column(
                children: [
                  SizedBox(height: mediaQuerySize.height * 0.08),
                  Center(
                    child: Text('Welcome Back', style: AppTextstyles.BoldBlackText()),
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.02),
                  CustomField(
                    controller: emailController,
                    text: 'Email',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!AppExtension.emailExtension.hasMatch(value.trim())) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.03),
                  Obx(() => CustomField(
                        text: 'Password',
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        isPasswordField: true,
                        isObscured: !authControllers.isPasswordVisible.value,
                        isSuffixIcon: true,
                        suffixIcon: IconButton(
                          icon: Icon(authControllers.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: authControllers.togglePasswordVisibility,
                        ),
                      )),
                  SizedBox(height: mediaQuerySize.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle_outlined, size: 20),
                          SizedBox(width: 5),
                          Text('Remember Password', style: AppTextstyles.SimpleBlackText()),
                        ],
                      ),
                      TextButton(
                        onPressed: () => Get.to(() => ForgotPasswordScreen()),
                        child: Text('Forgot Password?', style: AppTextstyles.SimpleBlackText()),
                      ),
                    ],
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.03),
                  Obx(() => CustomButton(
                        isLoading: authControllers.isLoading.value,
                        name: 'Continue',
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            authControllers.isLoading.value = true;
                            bool loginSuccess = await authControllers.signInWithEmailAndPassword(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                            authControllers.isLoading.value = false;

                            if (loginSuccess) {
                              Get.offAll(() => BottomNavigationBarScreen());
                            } else {
                              Get.printError();
                              // Get.snackbar(
                              //   "Login Failed",
                              //   "Invalid email or password. Please try again.",
                              //   snackPosition: SnackPosition.BOTTOM,
                              //   backgroundColor: Colors.red.withOpacity(0.8),
                              //   colorText: Colors.white,
                              // );
                            }
                          }
                        },
                      )),
                  SizedBox(height: mediaQuerySize.height * 0.03),
                  CustomButton(
                    name: 'Admin Login',
                    onTap: () => Get.offAll(AdminLoginScreen()),
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.03),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02),
                        child: Text('Or With', style: AppTextstyles.simpleGreyText()),
                      ),
                      Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                    ],
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaIconsRow(imgUrl: 'assets/images/google3.png'),
                      SizedBox(width: 15),
                      SocialMediaIconsRow(imgUrl: 'assets/images/fb.png'),
                      SizedBox(width: 15),
                      SocialMediaIconsRow(imgUrl: 'assets/images/appl_img.png'),
                    ],
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('If you don\'t have an account', style: AppTextstyles.simpleGreyText()),
                      TextButton(
                        onPressed: () => Get.to(() => SignupScreen()),
                        child: Text('Sign Up', style: AppTextstyles.simpleRedText()),
                      ),
                    ],
                  ),
                  SizedBox(height: mediaQuerySize.height * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




