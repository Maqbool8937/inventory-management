import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/getxControllers/drop_down.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/payment_method/customer_info_screen.dart';
import 'package:inventory_management_app/view/Screens/transfer_section/scan_image.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
import '../../../controllers/getxControllers/camera_controller.dart';
import '../widgets/camera_capture.dart';
import '../widgets/common_appbar.dart';

class InputAmountScreen extends StatefulWidget {
  InputAmountScreen({super.key});

  @override
  State<InputAmountScreen> createState() => _InputAmountScreenState();
}

class _InputAmountScreenState extends State<InputAmountScreen> {
   final CameraController _cameraController = Get.put(CameraController());
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
                Image.asset('assets/images/double_battery.png'),
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
                      CustomField(text: 'Call ID'),
                      SizedBox(height:mediaQuerySize.height*0.02.h),
                      CustomField(text: 'Battery Size'),
                    ],
                  ),
                ),
                                     SizedBox(height:mediaQuerySize.height*0.02.h),

                CustomButton(
                  onTap: (){
        //                Obx(() {
        //   return _cameraController.capturedImage.value != null
        //       ? Container(
        //           margin: EdgeInsets.all(10),
        //           padding: EdgeInsets.all(10),
        //           height: mediaQuerySize.height * 0.15.h,
        //           width: mediaQuerySize.width * 0.7.w,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             image: DecorationImage(
        //               image: FileImage(_cameraController.capturedImage.value!),
        //               fit: BoxFit.cover,
        //             ),
        //           ),
        //         )
        //       : GestureDetector(
        //           onTap: _cameraController.captureImage,
        //           child: Container(
        //             height: mediaQuerySize.height * 0.08.h,
        //             width: mediaQuerySize.width * 0.9.w,
        //             decoration: BoxDecoration(
        //               color: AppColors.buttonColor,
        //               //color: Colors.black.withOpacity(0.07),
        //               borderRadius: BorderRadius.circular(10),
        //             ),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Icon(Icons.camera_alt, color: Colors.white),
        //                 SizedBox(width: 8),
        //                 Text(
        //                   "Take a Photo",
        //                   style: TextStyle(color: Colors.white, fontSize: 16),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         );
        // });
                    Get.to(()=>Center(child: CameraCaptureWidget()));
                  },
                  name: 'Scan Battery'),
                                      SizedBox(height:mediaQuerySize.height*0.03.h),

                Text(
                  'Input Amount',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                                      SizedBox(height:mediaQuerySize.height*0.02.h),

                Container(
                  width: mediaQuerySize.width * 0.9,
                  height: mediaQuerySize.height*0.1.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xff00000012), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: CustomField(
                      text: 'Amount',
                      isPrefixIcon: true,
                      prefixIcon: Icon(Icons.request_page_sharp),
                    ),
                  ),
                ),
                                      SizedBox(height:mediaQuerySize.height*0.02.h),

                Container(
                  height: 50.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '49AGM-Cs',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                                      SizedBox(height:mediaQuerySize.height*0.02.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.03.w,vertical: mediaQuerySize.height*0.01.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price Details',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Container(
                       width: mediaQuerySize.width*0.3.w,
                              height: mediaQuerySize.height*0.05.h,
                        
                        decoration: BoxDecoration(
                          color: Color(0xffEDEDED),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: mediaQuerySize.width*0.15.w,
                              height: mediaQuerySize.height*0.05.h,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Qty',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Obx(
                                  () => DropdownButton<String>(
                                    value: dropdownController.selectedValue.value,
                                    onChanged: (String? newValue) {
                                      dropdownController.setSelectedValue(newValue!);
                                    },
                                    items: <String>['1', '2', '3', '4']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Center(child: Text(value)),
                                      );
                                    }).toList(),
                                    underline: Container(), // Remove the default underline
                                    isExpanded: true, // Ensure the dropdown button expands to fill the container
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                    onDoubleTap: (){
                        showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Add Extra Parts',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
          content: Text('Enter the amount you would like to add, extra sales tax will be applied',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
          actions: [
            CustomField(text: 'Amount',),
            SizedBox(height: mediaQuerySize.height*0.01.h,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                 CustomButton(
                  onTap: (){
                    Get.back();
                  },
                  width: mediaQuerySize.width*0.29,name: 'Cancel',color: Colors.grey.withOpacity(0.3),),
                 SizedBox(width: mediaQuerySize.width*0.02.w,),
                CustomButton(width: mediaQuerySize.width*0.29,name: 'Add'),
              ],
            ),
          )
          
          ],
        );
      },
    ); 
                    },
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
                    onDoubleTap: (){
                      AlertDialog(
          title: Center(child: Text('Add Other Fees',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
          content: Text('Enter the amount you would like to add',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
          actions: [
            CustomField(text: 'Amount',),
            SizedBox(height: mediaQuerySize.height*0.01.h,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                 CustomButton(
                  onTap: (){
                    Get.back();
                  },
                  width: mediaQuerySize.width*0.29,name: 'Cancel',color: Colors.grey.withOpacity(0.3),),
                 SizedBox(width: mediaQuerySize.width*0.02.w,),
                CustomButton(width: mediaQuerySize.width*0.29,name: 'Add'),
              ],
            ),
          )
          
          ],
        );
                    },
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
                       Container(
                        width: mediaQuerySize.width*0.8.w,
                        height: mediaQuerySize.height*0.06.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white,width: 1)
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(()=>CustomerInfoScreen());
                          },
                          child: Center(
                            child: Text('Next',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                          ),
                        ),
                       )
                    ],
                  ),
                ),
                SizedBox(height: mediaQuerySize.height*0.02.h,),
                Center(child: Text('Or',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),),
                                SizedBox(height: mediaQuerySize.height*0.02.h,),
                                CustomButton(name: 'Transfer'),
                                 SizedBox(height: mediaQuerySize.height*0.02.h,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}