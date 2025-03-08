import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/controllers/utils/app_textstyles.dart';
import 'package:inventory_management_app/view/Screens/bottom_navigation_bar.dart';
import 'package:inventory_management_app/view/Screens/home_section/home_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
class DeliveryCompletedScreen extends StatelessWidget {
  const DeliveryCompletedScreen({super.key});

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
            height: mediaQuerySize.height*0.44.h,
            width: mediaQuerySize.width*0.82.w,
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

                Text('Delivery Completed ',style: AppTextstyles.FullBlackBoldText(),),
                                         SizedBox(height: mediaQuerySize.height*0.03.h,),

                Text('Thank you for delivery the sales order #224099',
  textAlign: TextAlign.center, // Optional: Align the text
  style: TextStyle(fontSize: 16), // Optional: Add styling
),
                  
 SizedBox(height: mediaQuerySize.height*0.04.h,),

CustomButton(
  onTap: (){
    Get.to(()=>BottomNavigationBarScreen());
  },
  width: mediaQuerySize.width*0.7.w,
  name: 'Home')
              ],
            ),
           ),
         )
        ],
      )),
    );
  }
}