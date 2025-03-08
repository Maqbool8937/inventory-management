import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/auth_controllers.dart';
import 'package:inventory_management_app/controllers/getxControllers/drop_down.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
import '../widgets/checkout_circle.dart';
import '../widgets/common_appbar.dart';
import 'sale_completed_screen.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _InputAmountScreenState();
}

class _InputAmountScreenState extends State<CheckOutScreen> {
  final List<String> options = ["Credit Card", "Debit Card", "Cash on Delivery","Check"];

   final RxInt selectedIndex = (-1).obs;
  final DropdownController dropdownController = Get.put(DropdownController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  AuthControllers authControllers = Get.put(AuthControllers());

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
                Text('Checkout',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                      CustomField(text: 'Invoice Number'),
                     
                    ],
                  ),
                ),
                                     SizedBox(height:mediaQuerySize.height*0.02.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.04.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Payment Method',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)),
                ),
                                      SizedBox(height:mediaQuerySize.height*0.03.h),

               Container(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.01.w,vertical: mediaQuerySize.height*0.01.h),
                  width: mediaQuerySize.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(() => Column(
          children: List.generate(
            options.length, 
            (index) => CheckoutCircle(
              text: options[index], 
              index: index,
              selectedIndex: selectedIndex.value,
              onSelect: (newIndex) {
                selectedIndex.value = newIndex;
              },
            ),
          ),
        )),

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
                  height: mediaQuerySize.height*0.13.h,
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
                      Text('\$1100',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                     
                    ],
                  ),
                ),
              
                                SizedBox(height: mediaQuerySize.height*0.02.h,),
                                CustomButton(
                                  onTap: (){
                                    Get.to(()=>SaleCompletedScreen());
        //                             AlertDialog(
        //   title: Center(child: Text('You are a Dispatcher',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
        //   content: Text('What truck number you would like to submit this order on?',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
        //   actions: [
        //     CustomField(text: 'Truck Number',),
        //     SizedBox(height: mediaQuerySize.height*0.01.h,),
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Row(
        //       children: [
        //          CustomButton(
        //           onTap: (){
        //             Get.back();
        //           },
        //           width: mediaQuerySize.width*0.29,name: 'Cancel',color: Colors.grey.withOpacity(0.3),),
        //          SizedBox(width: mediaQuerySize.width*0.02.w,),
        //         CustomButton(width: mediaQuerySize.width*0.29,name: 'Submit'),
        //       ],
        //     ),
        //   )
          
        //   ],
        // );
                                  },
                                  name: 'Submit',width: mediaQuerySize.width*0.9.w,),
                                 SizedBox(height: mediaQuerySize.height*0.02.h,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}