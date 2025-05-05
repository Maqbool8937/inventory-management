import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/controller/customer_controller.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/payment_method/check_out_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
import 'package:inventory_management_app/view/Screens/widgets/customer_field.dart';
import '../widgets/common_appbar.dart';

class CustomerInfoScreen extends StatefulWidget {
  CustomerInfoScreen({super.key});

  @override
  State<CustomerInfoScreen> createState() => _CustomerInfoScreenState();
}

class _CustomerInfoScreenState extends State<CustomerInfoScreen> {
  final CustomerController customerController = Get.put(CustomerController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02.w, vertical: mediaQuerySize.height * 0.02.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CommonAppBar.commonAppBar(context, scaffoldKey),
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                Text('Customer Info', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: mediaQuerySize.height * 0.02.h),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.01.w, vertical: mediaQuerySize.height * 0.01.h),
                  width: mediaQuerySize.width * 0.9,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                     CustomerField(text: 'Member #', onChanged: (val) => customerController.memberNumber.value = val),
                      SizedBox(height: mediaQuerySize.height * 0.02.h),
                     CustomerField(text: 'Expiry Date', onChanged: (val) => customerController.expiryDate.value = val),
                    ],
                  ),
                ),
                
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                CustomButton(name: 'Scan ID'),
                SizedBox(height: mediaQuerySize.height * 0.03.h),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.01.w, vertical: mediaQuerySize.height * 0.01.h),
                  width: mediaQuerySize.width * 0.9,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                     CustomerField(text: 'Full Name', onChanged: (val) => customerController.fullName.value = val),
                      SizedBox(height: mediaQuerySize.height * 0.02.h),
                      CustomerField(text: 'Address', onChanged: (val) => customerController.address.value = val),
                      SizedBox(height: mediaQuerySize.height * 0.02.h),
                      CustomerField(text: 'City', onChanged: (val) => customerController.city.value = val),
                      SizedBox(height: mediaQuerySize.height * 0.02.h),
                      CustomerField(text: 'State', onChanged: (val) => customerController.state.value = val),
                      SizedBox(height: mediaQuerySize.height * 0.02.h),
                      CustomerField(text: 'Email', onChanged: (val) => customerController.email.value = val),
                      SizedBox(height: mediaQuerySize.height * 0.02.h),
                      CustomerField(text: 'Phone Number', onChanged: (val) => customerController.phoneNumber.value = val),
                    ],
                  ),
                ),

                SizedBox(height: mediaQuerySize.height * 0.02.h),

                CustomButton(

                  name: 'Save Customer Info',
                  onTap: () => customerController.saveCustomerInfo(),
                ),

                SizedBox(height: mediaQuerySize.height * 0.03.h),
                GestureDetector(
                  onTap: () {
                    Get.to(() => CheckOutScreen());
                  },
                  child: Container(
                    width: mediaQuerySize.width * 0.8.w,
                    height: mediaQuerySize.height * 0.06.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: Text('Next', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
                SizedBox(height: mediaQuerySize.height * 0.05.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
