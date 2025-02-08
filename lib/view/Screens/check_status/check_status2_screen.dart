import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/controllers/utils/app_textstyles.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
class CheckStatus2Screen extends StatelessWidget {
  const CheckStatus2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         SizedBox(height: mediaQuerySize.height*0.1.h,),
         Center(
           child: Container(
            height: mediaQuerySize.height*0.42.h,
            width: mediaQuerySize.width*0.7.w,
            decoration: BoxDecoration(
              color: AppColors.secondoryColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: Offset(0, 2)
                )
              ]
            ),
            child: Column(
              children: [
                         SizedBox(height: mediaQuerySize.height*0.05.h,),

                Container(
                  height: mediaQuerySize.height*0.1.h,
                  width: mediaQuerySize.width*0.22.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(55)
                  ),
                  child: Icon(Icons.check,color: Colors.white,size: 50,),
                ),
                                         SizedBox(height: mediaQuerySize.height*0.01.h,),

                Text('Transfer Pending - #5766',style: AppTextstyles.FullBlackBoldText(),),
                                         SizedBox(height: mediaQuerySize.height*0.03.h,),

                Text(
  '''Your Transfer is still pending
Please wait before transferring batteries''',
  textAlign: TextAlign.center, // Optional: Align the text
  style: TextStyle(fontSize: 16), // Optional: Add styling
),
                    SizedBox(height: mediaQuerySize.height*0.01.h,),

CustomButton(
  width: mediaQuerySize.width*0.6.w,
  name: 'Back')
              ],
            ),
           ),
         )
        ],
      )),
    );
  }
}