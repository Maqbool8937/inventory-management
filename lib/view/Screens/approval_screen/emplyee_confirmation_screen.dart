import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:inventory_management_app/controllers/getxControllers/auth_controllers.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/bottom_navigation_bar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

class EmployeeConfirmationScreen extends StatelessWidget {
  const EmployeeConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: mediaQuerySize.height,
        width: mediaQuerySize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Would you like to enter as an Employee?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.2, vertical: mediaQuerySize.height * 0.02),
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    onTap: () {
                      Get.to(() => BottomNavigationBarScreen());
                    },
                    name: 'No',
                    textStyle: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                    borderColor: AppColors.primaryColor,
                    color: Colors.transparent,
                  )),
                  SizedBox(
                    width: mediaQuerySize.width * 0.06,
                  ),
                  Expanded(
                      child: CustomButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Container(
                              height: mediaQuerySize.height * 0.2,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.01, vertical: mediaQuerySize.height * 0.015),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Request sent for admin approval!',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                    name: 'Yes',
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
