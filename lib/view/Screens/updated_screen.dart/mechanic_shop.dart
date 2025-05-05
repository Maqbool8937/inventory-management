import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

class MechanicShop extends StatelessWidget {
  const MechanicShop({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: mediaQuerySize.height*0.1,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Align(
                  alignment: Alignment.topLeft,
                   child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset('assets/images/aar.png')),
                 ),
               ),
                          SizedBox(height: mediaQuerySize.height*0.03,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/mechanic_icon.png'),
                              SizedBox(width: mediaQuerySize.width*0.03,),
                              Text('Mechanic Shop',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                            ],
                          ),
                        SizedBox(height: mediaQuerySize.height*0.03,),
                        Container(
                       //   height: mediaQuerySize.height*0.4,
                          width: mediaQuerySize.width*0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(blurRadius: 3,
                              spreadRadius: 0,
                              offset: Offset(0,1)
                              )
                            ]
                          ),
                          child: Column(
                            children: [
                                                    SizedBox(height: mediaQuerySize.height*0.02,),
          
                              Center(child: Text('Information',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),),
                                                    SizedBox(height: mediaQuerySize.height*0.03,),
                                           
                                        
                                            CustomField(text: 'Job Description',),
                                            SizedBox(height: mediaQuerySize.height*0.02,),
          
                            ],
                          ),
                        ),
                        SizedBox(height: mediaQuerySize.height*0.02,),
                        Center(
                          child: Text('Input Amount',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
          
                        ),
                        SizedBox(height: mediaQuerySize.height*0.02,),
                        Container(
                          height: mediaQuerySize.height*0.1,
                          width: mediaQuerySize.width*0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 0,
                                offset: Offset(0,1),
                              ),
                            ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomField(
                              text: 'Amount',
                              // isPrefixIcon: true,
                              // prefixIcon: Text('\$'),
                            ),
          
                          ),
                        ),
                         SizedBox(height: mediaQuerySize.height*0.02,),
                          Container(
                        width: mediaQuerySize.width.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColors.gredientColor1, AppColors.gredientColor2],
                          ),
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: mediaQuerySize.height * 0.03,
                          horizontal: mediaQuerySize.width * 0.01,
                        ),
                        child: Column(
                          children: [
                            Text('Total', style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold)),
                            SizedBox(height: mediaQuerySize.height * 0.015.h),
                            Text(
                              '\$234.67',
                          
                             // '\$${serviceData['totalPrice']?.toStringAsFixed(2) ?? '0.00'}',
                              style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(height: mediaQuerySize.height * 0.015.h),
                            CustomButton(
                              onTap: () {
                                //Get.to(() => RoadSideServices3());
                              },
                              borderColor: AppColors.whiteColor,
                              isEnabled: true,
                              name: 'Complete Payment',
                              color: Colors.transparent,
                            ),
                            SizedBox(height: mediaQuerySize.height * 0.015.h),
                            Text(
                              'plus tax, plus service charges',
                              style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: mediaQuerySize.height*0.02,)
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}