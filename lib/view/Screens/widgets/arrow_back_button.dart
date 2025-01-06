import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ArrowBackButton extends StatelessWidget {
  Color? arrowColor;
  Color? backgroundColor;

  ArrowBackButton({super.key, this.arrowColor, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: mediaQuerySize.height * 0.06.h,
          width: mediaQuerySize.width * 0.12.w,
          decoration: BoxDecoration(color: backgroundColor ?? Colors.black.withOpacity(0.07), shape: BoxShape.circle),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, color: arrowColor ?? Colors.grey)),
        ));
  }
}