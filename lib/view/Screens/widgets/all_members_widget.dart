import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/getxControllers/dropdown_controller.dart';
import '../../admin_section/employee_screen.dart';
import '../../admin_section/manager_screen.dart';
class AllMembersWidget extends StatelessWidget {
  final String name;
  final String initialRole;

  const AllMembersWidget({
    super.key,
    required this.name,
    required this.initialRole,
  });

  @override
  Widget build(BuildContext context) {
    final RoleController controller = Get.put(RoleController(initialRole: initialRole), tag: name);

    Size mediaQuerySize = MediaQuery.of(context).size;
    final List<String> roles = ["Employee", "Manager", "User"];

    return GestureDetector(
      onTap: () {
        if (controller.selectedRole.value == "Manager") {
          Get.to(ManagerScreen());
        } else if (controller.selectedRole.value == "Employee") {
          Get.to(AdminEmployeeScreen());
        } else if (controller.selectedRole.value == "User") {
          Get.to(AdminEmployeeScreen());
        } else {
          Get.snackbar(
            "Error",
            "Please select a role before proceeding!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      },
      child: Container(
        height: mediaQuerySize.height * 0.09.h,
        width: mediaQuerySize.width * 0.9.w,
        decoration: BoxDecoration(
          color: Color(0xff4573D1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuerySize.width * 0.04.w,
                vertical: mediaQuerySize.height * 0.01.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Obx(() => Text(
                        controller.selectedRole.value,
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: mediaQuerySize.width * 0.05.w),
              child: Container(
                height: mediaQuerySize.height * 0.055,
                width: mediaQuerySize.width * 0.34,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
   child: Obx(() {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: controller.selectedRole.value,
                      hint: Text("Select Role", style: TextStyle(color: Colors.black, fontSize: 14)),
                      icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                      isExpanded: true,
                     alignment: AlignmentDirectional.bottomEnd,
                      items: roles.map((role) {
                        return DropdownMenuItem<String>(
                          value: role,
                          child: Text(role),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        controller.setRole(newValue);
                      },
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  
                  );
                }),


               
              ),
            ),
          ],
        ),
      ),
    );
  }
}
