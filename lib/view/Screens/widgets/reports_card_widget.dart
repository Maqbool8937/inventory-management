import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/utils/app_colors.dart';

class ReportsCardWidget extends StatelessWidget {
  final String title;
  final String content;

  const ReportsCardWidget({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuerySize = MediaQuery.of(context).size;

    return Container(
      height: mediaQuerySize.height * 0.17.h,
      width: mediaQuerySize.width * 0.43.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: mediaQuerySize.height * 0.03.h),
          Container(
            height: mediaQuerySize.height * 0.04.h,
            width: mediaQuerySize.width * 0.8.w,
            decoration: BoxDecoration(
              color: AppColors.buttonColor, 
              borderRadius: BorderRadius.circular(0),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: mediaQuerySize.height * 0.01.h),
          Center(
            child: Text(
              content,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
