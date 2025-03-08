import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/getxControllers/drop_down.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/payment_method/check_out_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
import '../widgets/common_appbar.dart';

class CustomerInfoScreen extends StatefulWidget {
  CustomerInfoScreen({super.key});

  @override
  State<CustomerInfoScreen> createState() => _InputAmountScreenState();
}

class _InputAmountScreenState extends State<CustomerInfoScreen> {
  final DropdownController dropdownController = Get.put(DropdownController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.02.w,vertical: mediaQuerySize.height*0.02.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CommonAppBar.commonAppBar(context, scaffoldKey),
                SizedBox(height:mediaQuerySize.height*0.02.h),
                Text('Customer Info',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height:mediaQuerySize.height*0.02.h),
                Container(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.01.w,vertical: mediaQuerySize.height*0.01.h),
                  width: mediaQuerySize.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      CustomField(text: 'Member #'),
                      SizedBox(height:mediaQuerySize.height*0.02.h),
                      CustomField(text: 'Expiry Date'),
                    ],
                  ),
                ),
                                     SizedBox(height:mediaQuerySize.height*0.02.h),

                CustomButton(name: 'Scan ID'),
                                      SizedBox(height:mediaQuerySize.height*0.03.h),

               Container(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.01.w,vertical: mediaQuerySize.height*0.01.h),
                  width: mediaQuerySize.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      CustomField(text: 'Full Name'),
                      SizedBox(height:mediaQuerySize.height*0.02.h),
                      CustomField(text: 'Adress'),
                       SizedBox(height:mediaQuerySize.height*0.02.h),
                       CustomField(text: 'City'),
                        SizedBox(height:mediaQuerySize.height*0.02.h),
                        CustomField(text: 'State'),
                         SizedBox(height:mediaQuerySize.height*0.02.h),
                         CustomField(text: 'Email'),
                          SizedBox(height:mediaQuerySize.height*0.02.h),
                         CustomField(text: 'Phone Number'),

                    ],
                  ),
                ),
               
            
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.04.w,vertical: mediaQuerySize.height*0.01.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Price Details',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: mediaQuerySize.height*0.02.h,),
                Container(
                 // height: mediaQuerySize.height*0.1.h,
                  width: mediaQuerySize.width*0.9.w,
                  decoration: BoxDecoration(
                    color: Color(0xffEDEDED),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.03.w,vertical: mediaQuerySize.height*0.01.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Non-Member Price'),
                            Spacer(),
                            Text('\$200')
                          ],
                        ),
                        SizedBox(height: mediaQuerySize.height*0.01.h,),
                         Row(
                          children: [
                            Text('Member Discount'),
                            Spacer(),
                           Text('-\$20')

                          ],
                        ),
                         SizedBox(height: mediaQuerySize.height*0.01.h,),
                         Row(
                          children: [
                            Text('Member Price'),
                            Spacer(),
                            Text('\$20')
                          ],
                        ),
                         SizedBox(height: mediaQuerySize.height*0.01.h,),
                         Row(
                          children: [
                            Text('Prorated Refund'),
                            Spacer(),
                            Text('\$100')
                          ],
                        ),
                         SizedBox(height: mediaQuerySize.height*0.01.h,),
                         Row(
                          children: [
                            Text('Delivery Charges'),
                            Spacer(),
                            Text('\$0')
                          ],
                        ),
                         SizedBox(height: mediaQuerySize.height*0.01.h,),
                         Row(
                          children: [
                            Text('Estimated Tax and Disposal Fee'),
                            Spacer(),
                            Text('\$22')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: mediaQuerySize.height*0.02.h,),
                Container(
                  width: mediaQuerySize.width*0.9.w,
                  height: mediaQuerySize.height*0.07.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10)
                  
                  ),
                  child: GestureDetector(
                    onDoubleTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,color: Colors.white,weight: 11,size: 30,),
                        Text('Add Extra Parts',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                ),
                  SizedBox(height: mediaQuerySize.height*0.03.h,),
                Container(
                  width: mediaQuerySize.width*0.9.w,
                  height: mediaQuerySize.height*0.07.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10)
                  
                  ),
                  child: GestureDetector(
                    onDoubleTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,color: Colors.white,weight: 11,size: 30,),
                        Text('Add Other Fees',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: mediaQuerySize.height*0.02.h,),
                Container(
                  height: mediaQuerySize.height*0.2.h,
                  width: mediaQuerySize.width*0.9.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: mediaQuerySize.height*0.02.h,),
                      Text('Total',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                       SizedBox(height: mediaQuerySize.height*0.01.h,),
                      Text('\$234.67',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                       SizedBox(height: mediaQuerySize.height*0.02.h,),
                       GestureDetector(
                        onTap: (){
                          Get.to(()=>CheckOutScreen());
                        },
                         child: Container(
                          width: mediaQuerySize.width*0.8.w,
                          height: mediaQuerySize.height*0.06.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white,width: 1)
                          ),
                          child: Center(
                            child: Text('Next',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                          ),
                         ),
                       )
                    ],
                  ),
                ),
                SizedBox(height: mediaQuerySize.height*0.05.h,),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}