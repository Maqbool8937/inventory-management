import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_management_app/controllers/auth_controllers.dart';
import 'package:inventory_management_app/controllers/getxControllers/drop_down.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/payment_method/delivery_completed_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/camera_capture.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
import '../widgets/checkout_circle.dart';
import '../widgets/common_appbar.dart';
import '../widgets/image_picker_widget.dart';

class DeliveryPhotoScreen extends StatefulWidget {
  DeliveryPhotoScreen({super.key});

  @override
  State<DeliveryPhotoScreen> createState() => _InputAmountScreenState();
}

class _InputAmountScreenState extends State<DeliveryPhotoScreen> {
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
                Text('Delivery Photo',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height:mediaQuerySize.height*0.02.h),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.03.w,vertical: mediaQuerySize.height*0.01.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Deliver To',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                ),
                Container(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.01.w,vertical: mediaQuerySize.height*0.01.h),
                  width: mediaQuerySize.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomField(text: '20092'),
                ),
                 SizedBox(height:mediaQuerySize.height*0.02.h),
                Container(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.01.w,vertical: mediaQuerySize.height*0.01.h),
                  width: mediaQuerySize.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomField(text: 'Full Name'),
                ),
                                     SizedBox(height:mediaQuerySize.height*0.02.h),
                                     CameraCaptureWidget(),
                                     SizedBox(height: mediaQuerySize.height*0.02.h,),
                                     Center(child: Text('or',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),),
                                      SizedBox(height: mediaQuerySize.height*0.02.h,),
                                      ImagePickerWidget(buttonIcon:Icons.file_copy,buttonText: 'Select Photo',imageSource: ImageSource.gallery,),
                                     SizedBox(height: mediaQuerySize.height*0.08.h,),
                                     CustomButton(
                                      onTap: (){
                                        Get.to(()=>DeliveryCompletedScreen());
                                      },
                                      name: 'Complete Delivery',width: mediaQuerySize.width*0.9.w,),

              
               
            
              
                         
              ]
                        )
                      
                    ),
                  ),
                ),
                
    );

  }
}