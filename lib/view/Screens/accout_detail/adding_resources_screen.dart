import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/controllers/utils/app_textstyles.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';

class AddingResourcesScreen extends StatelessWidget {
  const AddingResourcesScreen({super.key});

 @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.02.h, horizontal: mediaQuerySize.width * 0.03.w),
          child: Column(
           children: [
            SizedBox(height: mediaQuerySize.height*0.03.h,),
            CommonAppBar(),
            SizedBox(height: mediaQuerySize.height*0.02.h,),
            Container(
              height: mediaQuerySize.height*0.15.h,
             
              decoration: BoxDecoration(
                color: AppColors.primaryColor
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('Good Afternoon!',style: AppTextstyles.simpleText(),)
                    ],
                  )
                ],
              ),
            )
           ],
          ),
          ),
          ),
          );
  }
}