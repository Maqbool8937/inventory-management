import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/authentication/signup_screen.dart';
import 'package:inventory_management_app/view/Screens/settings_section/change_password_screen.dart';
import 'package:inventory_management_app/view/admin_section/all_member_screen.dart';

import '../authentication/login_screen.dart';
import '../widgets/common_appbar.dart';

class SettingsOneScreen extends StatelessWidget {
  SettingsOneScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: mediaQuerySize.height * 0.03,
              horizontal: mediaQuerySize.width * 0.03,
            ),
            child: Column(
              children: [
                SizedBox(height: mediaQuerySize.height * 0.03),
                SizedBox(height: mediaQuerySize.height * 0.05),
                _commonWidget(
                  context,
                  ontap: () {
                    Get.to(() => AllMemberScreen());
                  },
                  text: 'Manage Permissions',
                  icon: Icons.edit_note_outlined,
                ),
                SizedBox(height: mediaQuerySize.height * 0.03),
                _commonWidget(
                  context,
                  ontap: () {
                    Get.to(() => ChangePasswordScreen());
                  },
                  text: 'Change Password',
                  icon: Icons.edit_note_outlined,
                ),
                SizedBox(height: mediaQuerySize.height * 0.03),
                _commonWidget(
                  context,
                  ontap: () {
                    _showLogoutDialog(context, mediaQuerySize);
                  },
                  text: 'Logout',
                  icon: Icons.logout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, Size mediaQuerySize) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Are you sure you\n want to logout?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: mediaQuerySize.height * 0.02),
             
           
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                     Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color:Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                     Get.to(LoginScreen());
                   //    Get.to(SignupScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                    ),
                    child: Text(
                      "Confirm",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _commonWidget(
    BuildContext context, {
    required String text,
    required IconData icon,
    void Function()? ontap,
  }) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: mediaQuerySize.height * 0.08,
        width: mediaQuerySize.width * 0.9,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mediaQuerySize.width * 0.03,
            vertical: mediaQuerySize.height * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: AppColors.secondoryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Icon(
                icon,
                color: AppColors.secondoryColor,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

