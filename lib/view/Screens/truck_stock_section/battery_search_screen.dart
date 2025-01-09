import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/controllers/utils/app_textstyles.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
import 'package:svg_flutter/svg.dart';
import '../widgets/common_appbar.dart';
import '../widgets/common_truck_icon.dart';

class BatterySearchScreen extends StatelessWidget {
  BatterySearchScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
        body: SingleChildScrollView(
            child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03.h, horizontal: mediaQuerySize.width * 0.03.w),
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuerySize.height * 0.05.h,
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.05.h,
                ),
                Container(
                    height: mediaQuerySize.height * 0.09.h,
                    width: mediaQuerySize.width * 0.85.w,
                    decoration: BoxDecoration(color: AppColors.secondoryColor, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(blurRadius: 4, spreadRadius: 1, offset: Offset(0, 2))]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.01.h, horizontal: mediaQuerySize.width * 0.03.w),
                      child: CustomField(
                        isPrefixIcon: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.01.h, horizontal: mediaQuerySize.width * 0.03.w),
                          child: Text(
                            '244-C',
                            style: AppTextstyles.NormalBlackText(),
                          ),
                        ),
                        isSuffixIcon: true,
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.01.h, horizontal: mediaQuerySize.width * 0.03.w),
                          child: DropdownButton<String>(
                            items: [
                              DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
                              DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
                              DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),
                            ],
                            onChanged: (value) {
                              print("Selected: $value");
                            },
                            hint: Text(''), // Placeholder text
                            value: null, // Default value, set this to a value to pre-select an option
                            underline: Container(), // Removes the underline
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CustomButton(name: 'Search'),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Container(
                  height: mediaQuerySize.height * 0.2.h,
                  width: mediaQuerySize.width * 0.9.w,
                  decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(blurRadius: 4, spreadRadius: 1, offset: Offset(0, 2))]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Battery 244-C',
                        style: AppTextstyles.BoldBlackText(),
                      ),
                      SizedBox(
                        height: mediaQuerySize.height * 0.03.h,
                      ),
                      CustomButton(width: mediaQuerySize.width * 0.5.w, name: '16 Batteries')
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CommonTruckIcon(
                          text1: '#200',
                          text2: 'Has 2',
                        ),
                        SizedBox(
                          width: mediaQuerySize.width * 0.01.w,
                        ),
                        CommonTruckIcon(
                          text1: '#200',
                          text2: 'Has 2',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mediaQuerySize.height * 0.02.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CommonTruckIcon(
                          text1: '#200',
                          text2: 'Has 2',
                        ),
                        SizedBox(
                          width: mediaQuerySize.width * 0.01.w,
                        ),
                        CommonTruckIcon(
                          text1: '#200',
                          text2: 'Has 2',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mediaQuerySize.height * 0.02.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CommonTruckIcon(
                          text1: '#200',
                          text2: 'Has 2',
                        ),
                        SizedBox(
                          width: mediaQuerySize.width * 0.01.w,
                        ),
                        CommonTruckIcon(
                          text1: '#200',
                          text2: 'Has 2',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mediaQuerySize.height * 0.02.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CommonTruckIcon(
                          text1: '#200',
                          text2: 'Has 2',
                        ),
                        SizedBox(
                          width: mediaQuerySize.width * 0.01.w,
                        ),
                        CommonTruckIcon(
                          text1: '#200',
                          text2: 'Has 2',
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
