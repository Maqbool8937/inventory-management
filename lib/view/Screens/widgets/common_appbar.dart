import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/accout_detail/adding_resources_screen.dart';

class CommonAppBar {
  static AppBar commonAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02, vertical: mediaQuerySize.height * 0.01),
        child: GestureDetector(
          onTap: () {
            scaffoldKey.currentState?.openDrawer(); // Use the scaffoldKey to open the drawer
          },
          child: Container(
            decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(5)),
            child: const Icon(
              Icons.menu,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
      centerTitle: true,
      title: Text('Messoge'),
      actions: [
        GestureDetector(
          onTap: (){
            Get.to(()=>AddingResourcesScreen());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.025, vertical: mediaQuerySize.height * 0.01),
              decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.person,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
