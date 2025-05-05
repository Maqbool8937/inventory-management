import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_management_app/controllers/getxControllers/employe_login_controller.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';

class LoginAsEmployee extends StatelessWidget {
  LoginAsEmployee({Key? key}) : super(key: key);

  final EmployeeLoginController controller = Get.put(EmployeeLoginController());

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            /// **🔹 Title**
            Container(
              margin: EdgeInsets.only(top: mediaQuerySize.height * 0.2),
              child: Text(
                "Login As Employee",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),

            /// **🔹 Login Form**
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Company ID"),
                      onChanged: (value) {
                        controller.companyId.value = value.trim();
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(labelText: "User ID"),
                      onChanged: (value) {
                        controller.userId.value = value.trim();
                      },
                    ),
                  ],
                ),
              ),
            ),

            /// **🔹 Login Button**
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("Login Attempt → Company ID: ${controller.companyId.value} | User ID: ${controller.userId.value}");
                      controller.loginEmployee(controller.companyId.value, controller.userId.value);
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Obx(() => controller.isLoading.value
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text("Login", style: TextStyle(color: Colors.white, fontSize: 18))),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// **🔹 Divider**
            Text(
              "Or",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),

            /// **🔹 Add Employee Form**
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Company ID"),
                      onChanged: (value) {
                        controller.companyId.value = value.trim();
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(labelText: "User ID"),
                      onChanged: (value) {
                        controller.userId.value = value.trim();
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Full Name"),
                      onChanged: (value) {
                        controller.name.value = value.trim();
                      },
                    ),
                  ],
                ),
              ),
            ),

            /// **🔹 Add Employee Button**
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("Adding Employee → Company ID: ${controller.companyId.value} | User ID: ${controller.userId.value} | Name: ${controller.name.value}");
                      controller.addEmployee(controller.companyId.value, controller.userId.value, controller.name.value);
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Obx(() => controller.isLoading.value
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text("Add Employee", style: TextStyle(color: Colors.white, fontSize: 18))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
