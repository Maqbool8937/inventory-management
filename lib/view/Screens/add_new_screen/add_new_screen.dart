import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/getxControllers/addnew_controller.dart';
import 'package:inventory_management_app/controllers/utills/common_dropdown.dart';
import 'package:inventory_management_app/controllers/utills/common_textfield.dart';
import 'package:inventory_management_app/controllers/utills/common_widget.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';

class AddNewScreen extends StatelessWidget {
  AddNewScreen({super.key});

  final AddNewController controller = Get.put(AddNewController());

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar("Message"),
      body: SafeArea(
        child: ListView(
          children: [
            /// **🔹 Title**
            Container(
              margin: EdgeInsetsDirectional.only(top: mediaQuerySize.height * 0.05),
              child: Text(
                textAlign: TextAlign.center,
                "Add New Screen",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),

            /// **🔹 Form Fields**
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    /// **Business Name**
                    buildCommonTextField(
                      "Business Name",
                      controller: controller.businessNameController,
                    ),
                    SizedBox(height: 10),

                    /// **Category Dropdown**
                    Obx(() => DropdownInCard(
                          selected: controller.category.value,
                          items: ["Cat 1", "Cat 2", "Cat 3"],
                          hintText: "Category",
                          onChange: (value) {
                            controller.category.value = value;
                          },
                        )),
                    SizedBox(height: 10),

                    /// **Phone Number**
                    buildCommonTextField(
                      "Phone No.",
                      controller: controller.phoneNoController,
                    ),
                    SizedBox(height: 10),

                    /// **Email**
                    buildCommonTextField(
                      "Email",
                      controller: controller.emailController,
                    ),
                    SizedBox(height: 10),

                    /// **Website**
                    buildCommonTextField(
                      "Website",
                      controller: controller.websiteController,
                    ),
                    SizedBox(height: 10),

                    /// **Request Details**
                    buildCommonTextField(
                      "Request",
                      line: 3,
                      controller: controller.requestTextController,
                    ),
                  ],
                ),
              ),
            ),

            /// **🔹 Submit Button**
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.addNewEntry(),
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
                            : Text("Send Request", style: TextStyle(color: Colors.white, fontSize: 18))),
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
