import 'package:flutter/material.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';

commonAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    ),
    leading: IconButton(
      onPressed: () {},
      icon: Container(
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(5)),
        child: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
    ),
    // leading: Container(
    //     padding: EdgeInsets.zero,
    //     decoration: BoxDecoration(
    //         color: AppColors.primaryColor,
    //         borderRadius: BorderRadius.circular(5)),
    //     child: Icon(Icons.menu)),
    actions: [
      Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(5)),
          child: Icon(
            Icons.person,
            color: Colors.white,
          ))
    ],
  );
}
