import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/controller/battery_controller.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/battery_screen_3.dart';
import 'package:inventory_management_app/view/Screens/transfer_section/transfer_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
import 'package:inventory_management_app/view/Screens/widgets/scan_battery_widget.dart';


class BatteryScreen2 extends StatelessWidget {
  BatteryScreen2({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final BatteryController batteryController = Get.put(BatteryController());

  final TextEditingController callIdController = TextEditingController();
  final TextEditingController batterySizeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: mediaQuerySize.height * 0.025.h),
                Image.asset('assets/images/double_battery.png'),
                SizedBox(height: mediaQuerySize.height * 0.02),

                // **Battery Form Inputs**
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        CustomField(
                          controller: callIdController,
                          text: 'Call ID',
                        ),
                        SizedBox(height: 12),
                        CustomField(
                          controller: batterySizeController,
                          text: 'Battery Size',
                        ),
                        SizedBox(height: 12),
                        CustomField(
                          controller: amountController,
                          text: 'Amount',
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 12),

                // **Scan Battery**
                CustomButton(
                  onTap: () {
                    Get.to(() => ScanBatteryWidget());
                  },
                  name: 'Scan Battery',
                  width: mediaQuerySize.width,
                  color: AppColors.primaryColor,
                ),

                SizedBox(height: 12),

                // **Save Battery Data to Firebase**
                CustomButton(
                  onTap: () {
                    double amount = double.tryParse(amountController.text) ?? 0;
                    if (callIdController.text.isNotEmpty &&
                        batterySizeController.text.isNotEmpty &&
                        amount > 0) {
                      batteryController.addBatteryData(
                        callIdController.text,
                        batterySizeController.text,
                        amount,
                      );
                    } else {
                      Get.snackbar('Error', 'Please fill all fields correctly');
                    }
                  },
                  name: 'Save Battery Data',
                  width: mediaQuerySize.width,
                  color: AppColors.primaryColor,
                ),

                SizedBox(height: 12),

                // **Complete Payment**
                Container(
                  width: mediaQuerySize.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.gredientColor1, AppColors.gredientColor2],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03),
                  child: Column(
                    children: [
                      Text('Total', style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold)),
                      SizedBox(height: 12),
                      Text('\$${amountController.text}', style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(height: 12),
                      CustomButton(
                        onTap: () {
                          Get.to(() => BatteryScreen3());
                        },
                        borderColor: AppColors.whiteColor,
                        isEnabled: true,
                        name: 'Complete Payment',
                        color: Colors.transparent,
                      ),
                      SizedBox(height: 12),
                      Text('plus tax, plus service charges', style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),

                SizedBox(height: 12),

                // **Transfer Button**
                CustomButton(
                  onTap: () {
                    Get.to(() => TransferScreenOne());
                  },
                  width: mediaQuerySize.width,
                  name: 'Transfer',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
