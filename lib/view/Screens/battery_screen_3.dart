import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/battery_and_road_screen_4.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

import 'payment_method/input_amount_screen.dart';

class BatteryScreen3 extends StatelessWidget {
  BatteryScreen3({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03.w, vertical: mediaQuerySize.height * 0.01.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuerySize.height * 0.025.h,
                ),
                Image.asset(
                  'assets/images/double_battery.png',
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.02,
                ),
                CustomButton(
                    onTap: () {
                      Get.to(() => BatteryAndRoadScreen4());
                    },
                    width: mediaQuerySize.width,
                    name: 'Tap to Charge'),
                SizedBox(
                  height: mediaQuerySize.height * 0.02,
                ),
                Text('Or'),
                SizedBox(
                  height: mediaQuerySize.height * 0.02,
                ),
                Card(
                  shadowColor: Colors.black,
                  elevation: 10,
                  borderOnForeground: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.aspectRatio * 0.01.w, vertical: mediaQuerySize.height * 0.02.h),
                    child: Column(
                      children: [
                        CustomField(
                          text: 'Full Name',
                        ),
                        SizedBox(
                          height: mediaQuerySize.height * 0.02,
                        ),
                        CustomField(
                          text: 'Card Number',
                        ),
                        SizedBox(
                          height: mediaQuerySize.height * 0.02,
                        ),
                        CustomField(
                          text: 'Expiration Date',
                        ),
                        SizedBox(
                          height: mediaQuerySize.height * 0.02,
                        ),
                        CustomField(
                          text: 'CVV',
                        ),
                        SizedBox(
                          height: mediaQuerySize.height * 0.02,
                        ),
                        CustomField(
                          text: 'Address',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.02,
                ),
                CustomButton(
                  onTap: (){
                  Get.to(()=>InputAmountScreen());
              
    
                  },
                  width: mediaQuerySize.width, name: 'Pay'),
                SizedBox(
                  height: mediaQuerySize.height * 0.02,
                ),
                CustomButton(
                  onTap: (){
                     showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.centerRight,
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.cancel_outlined)),
          ),
          content: Column(
          mainAxisSize: MainAxisSize.min,
            children: [Text('Your Reciept Number is',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                     Text('000001',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
            ],
          ),
          actions: [
          CustomButton(name: 'Copy Number')
          
          ],
        );
      },
    ); 
        
                  },
                  borderColor: AppColors.primaryColor,
                  color: Colors.transparent,
                  width: mediaQuerySize.width,
                  name: 'Skip Payment',
                  textStyle: TextStyle(color: AppColors.primaryColor, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
