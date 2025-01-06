import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';

class CommonMidWidget extends StatelessWidget {
  String name;
  CommonMidWidget({super.key, this.name = 'Adam 55'});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      width: mediaQuerySize.width.w,
      color: AppColors.primaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.08, vertical: mediaQuerySize.height * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Good Afternoon!',
                  style: TextStyle(color: Color.fromARGB(221, 255, 255, 255), fontSize: 18, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.005,
                ),
                Text(
                  name,
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/double_battery.png',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
