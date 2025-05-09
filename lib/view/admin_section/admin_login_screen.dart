
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_management_app/view/Screens/authentication/forgot_password.dart';
import 'package:inventory_management_app/view/admin_section/manager_screen.dart';

import '../../../controllers/utils/app_extension.dart';
import '../../../controllers/utils/app_textstyles.dart';
import '../Screens/widgets/custom-field.dart';
import '../Screens/widgets/custom_button.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;

  Future<void> loginAdmin() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    try {
      // Ensure fresh login session
      await _auth.signOut();

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      User? user = userCredential.user;
      if (user == null) {
        Get.snackbar("Error", "Login failed. Try again.", snackPosition: SnackPosition.BOTTOM);
        return;
      }

      String userId = user.uid;

      // Fetch user role from Firestore
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();

      if (!userDoc.exists || !userDoc.data().toString().contains('role')) {
        Get.snackbar("Access Denied", "You are not an admin!", snackPosition: SnackPosition.BOTTOM);
        await _auth.signOut(); // Log out if not an admin
        return;
      }

      String role = userDoc.get('role');

      if (role == 'admin') {
        Get.offAll(() => ManagerScreen());
      } else {
        Get.snackbar("Access Denied", "You are not an admin!", snackPosition: SnackPosition.BOTTOM);
        await _auth.signOut();
      }
    } catch (e) {
      Get.snackbar("Login Failed", "Error: ${e.toString()}", snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

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
                padding: EdgeInsets.symmetric(
                  horizontal: mediaQuerySize.width * 0.05.w,
                  vertical: mediaQuerySize.height * 0.01.h,
                ),
                child: Column(
                  children: [
                    SizedBox(height: mediaQuerySize.height * 0.08.h),
                    Center(child: Text('Admin Login', style: AppTextstyles.BoldBlackText())),
                    SizedBox(height: mediaQuerySize.height * 0.02.h),
                    CustomField(
                      controller: emailController,
                      text: 'Email',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) return 'Please enter your email';
                        if (!AppExtension.emailExtension.hasMatch(value.trim())) return 'Enter a valid email';
                        return null;
                      },
                    ),
                    SizedBox(height: mediaQuerySize.height * 0.03.h),
                    CustomField(
                      text: 'Password',
                      controller: passwordController,
                      validator: (value) => value!.isEmpty ? 'Please enter your password' : null,
                      isPasswordField: true,
                      isObscured: !isPasswordVisible.value,
                      isSuffixIcon: true,
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible.value ? Icons.visibility : Icons.visibility_off),
                        onPressed: () => isPasswordVisible.value = !isPasswordVisible.value,
                      ),
                    ),
                    SizedBox(height: mediaQuerySize.height * 0.03.h),
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
                          child: Text('Forget Password?', style: AppTextstyles.SimpleBlackText()),
                        ),
                      ],
                    ),
                    SizedBox(height: mediaQuerySize.height * 0.03.h),
                    CustomButton(
                      isLoading: isLoading.value,
                      name: 'Login',
                      onTap: loginAdmin,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

