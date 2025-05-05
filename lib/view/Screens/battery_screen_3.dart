import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/controller/bp_controller.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/battery_and_road_screen_4.dart';
import 'package:inventory_management_app/view/Screens/payment_method/customer_info_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

import 'payment_method/input_amount_screen.dart';
class BatteryScreen3 extends StatelessWidget {
  BatteryScreen3({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PaymentCOntroll controller = Get.put(PaymentCOntroll());

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03, vertical: mediaQuerySize.height * 0.01),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/double_battery.png'),
                SizedBox(height: mediaQuerySize.height * 0.02),

                CustomButton(
                  onTap: () => Get.to(() => BatteryAndRoadScreen4()),
                  width: mediaQuerySize.width,
                  name: 'Tap to Charge',
                ),

                SizedBox(height: mediaQuerySize.height * 0.02),
                Text('Or'),
                SizedBox(height: mediaQuerySize.height * 0.02),

                /// **Payment Form**
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomField(
                          text: 'Full Name',
                          onChanged: (val) => controller.fullName.value = val,
                        ),
                        SizedBox(height: mediaQuerySize.height*0.02.h,),
                        CustomField(
                          text: 'Card Number',
                          onChanged: (val) => controller.cardNumber.value = val,
                        ),
                         SizedBox(height: mediaQuerySize.height*0.02.h,),
                        CustomField(
                          text: 'Expiration Date',
                          onChanged: (val) => controller.expirationDate.value = val,
                        ),
                         SizedBox(height: mediaQuerySize.height*0.02.h,),
                        CustomField(
                          text: 'CVV',
                          onChanged: (val) => controller.cvv.value = val,
                        ),
                         SizedBox(height: mediaQuerySize.height*0.02.h,),
                        CustomField(
                          text: 'Address',
                          onChanged: (val) => controller.address.value = val,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: mediaQuerySize.height * 0.02),

                /// **Save Payment Button**
                Obx(() => CustomButton(
                      onTap: (){
                 controller.isLoading.value ? null : () => controller.savePaymentDetails();
                 Get.to(()=>CustomerInfoScreen());
                      },
                      width: mediaQuerySize.width,
                      name: controller.isLoading.value ? 'Saving...' : 'Pay',
                    )),

                SizedBox(height: mediaQuerySize.height * 0.02),

                /// **Skip Payment**
                CustomButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.cancel_outlined),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Your Receipt Number is', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('000001', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        actions: [
                          CustomButton(name: 'Copy Number')
                        ],
                      ),
                    );
                  },
                  borderColor: AppColors.primaryColor,
                  color: Colors.transparent,
                  width: mediaQuerySize.width,
                  name: 'Skip Payment',
                  textStyle: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
