

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/controllers/utils/app_textstyles.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
import '../widgets/common_appbar.dart';
import '../widgets/common_truck_icon.dart';

class BatterySearchScreen extends StatefulWidget {
  BatterySearchScreen({super.key});
  @override
  State<BatterySearchScreen> createState() => _BatterySearchScreenState();
}

class _BatterySearchScreenState extends State<BatterySearchScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _batteryController = TextEditingController();
  String selectedBattery = '244-C';

  Future<void> saveBatterySearchToFirebase() async {
    try {
      await FirebaseFirestore.instance.collection('battery_searches').add({
        'battery_code': selectedBattery,
        'searched_at': DateTime.now(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Battery search saved!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: mediaQuerySize.height * 0.03.h,
              horizontal: mediaQuerySize.width * 0.03.w,
            ),
            child: Column(
              children: [
                SizedBox(height: mediaQuerySize.height * 0.05.h),
                Container(
                  height: mediaQuerySize.height * 0.09.h,
                  width: mediaQuerySize.width * 0.85.w,
                  decoration: BoxDecoration(
                    color: AppColors.secondoryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(blurRadius: 4, spreadRadius: 1, offset: Offset(0, 2))
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: mediaQuerySize.height * 0.01.h,
                      horizontal: mediaQuerySize.width * 0.03.w,
                    ),
                    child: CustomField(
                      isPrefixIcon: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: mediaQuerySize.height * 0.01.h,
                          horizontal: mediaQuerySize.width * 0.03.w,
                        ),
                        child: Text(
                          selectedBattery,
                          style: AppTextstyles.NormalBlackText(),
                        ),
                      ),
                      isSuffixIcon: true,
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: mediaQuerySize.height * 0.01.h,
                          horizontal: mediaQuerySize.width * 0.01.w,
                        ),
                        child: DropdownButton<String>(
                          items: [
                            DropdownMenuItem(value: '244-C', child: Text('244-C')),
                            DropdownMenuItem(value: '255-D', child: Text('255-D')),
                            DropdownMenuItem(value: '266-E', child: Text('266-E')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedBattery = value!;
                            });
                          },
                          value: selectedBattery,
                          underline: Container(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: mediaQuerySize.height * 0.03.h),
                CustomButton(
                  name: 'Search',
                  onTap: saveBatterySearchToFirebase,
                ),
                SizedBox(height: mediaQuerySize.height * 0.03.h),
                Container(
                  height: mediaQuerySize.height * 0.2.h,
                  width: mediaQuerySize.width * 0.9.w,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(blurRadius: 4, spreadRadius: 1, offset: Offset(0, 2))],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Battery $selectedBattery', style: AppTextstyles.BoldBlackText()),
                      SizedBox(height: mediaQuerySize.height * 0.03.h),
                      CustomButton(
                        width: mediaQuerySize.width * 0.5.w,
                        name: '16 Batteries',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: mediaQuerySize.height * 0.03.h),
                // Repeatable truck rows
                ...List.generate(4, (_) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: mediaQuerySize.height * 0.02.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CommonTruckIcon(text1: '#200', text2: 'Has 2'),
                        CommonTruckIcon(text1: '#200', text2: 'Has 2'),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

