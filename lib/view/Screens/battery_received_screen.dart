import 'package:flutter/material.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

class BatteryReceivedScreen extends StatelessWidget {
  const BatteryReceivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.04),
        child: Column(
          children: [
        SizedBox(height: mediaQuerySize.height*0.4,),
        Container(
          height: mediaQuerySize.height*0.4,
          width: mediaQuerySize.width*0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 1)
              )
            ]
          ),
          child: Column(
            children: [
              SizedBox(height: mediaQuerySize.height*0.06,),
              Container(
                height: mediaQuerySize.height*0.1,
                width: mediaQuerySize.width*0.2,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(40)
                ),
                child: Icon(Icons.check,color: Colors.white,size: 50,weight:50,),
              ),
              SizedBox(height: mediaQuerySize.height*0.02,),
              Text('Battery Recieved - #5766',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
                SizedBox(height: mediaQuerySize.height*0.02,),
              Text('Thank you for updating status',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                              SizedBox(height: mediaQuerySize.height*0.02,),
                       CustomButton(name: 'Back to home')

            ],
          ),
        )
          ],
        ),
      ),
    );
  }
}