import 'package:flutter/material.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';

class CommonAppBar {
  static AppBar commonAppBar(context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return AppBar(
      leading: Container(
        padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.013, vertical: mediaQuerySize.height * 0.0),
        decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(5)),
        child: const Icon(
          Icons.menu,
          color: AppColors.whiteColor,
        ),
      ),
      title: Text('Messoge'),
      actions: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.013, vertical: mediaQuerySize.height * 0.0055),
          decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(5)),
          child: const Icon(
            Icons.person,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
