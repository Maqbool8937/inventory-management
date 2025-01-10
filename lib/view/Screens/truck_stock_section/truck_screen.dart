import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/controllers/utils/app_textstyles.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
import '../widgets/common_appbar.dart';
import '../widgets/common_truck_icon.dart';

class TruckScreen extends StatelessWidget {
  TruckScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> dropdownItems = ["200", "300", "400", "500", "600"];

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
                  height: mediaQuerySize.height * 0.03.h,
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.05.h,
                ),
                CustomButton(
                  name: 'Filter Trucks',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        contentPadding: EdgeInsets.all(0),
                        content: Container(
                            height: mediaQuerySize.height * 0.35,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02, vertical: mediaQuerySize.height * 0.015),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Filter Trucks',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: mediaQuerySize.width * 0.1,
                                      ),
                                      IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.02,
                                  ),
                                  CustomField(
                                    isSuffixIcon: true,
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        DropdownButton<String>(
                                            // value: selectedValue,
                                            hint: Text("Select a value"),
                                            items: dropdownItems.map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {});
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.02,
                                  ),
                                  CustomButton(name: 'Filter')
                                ],
                              ),
                            )),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.05.h,
                ),
                Container(
                  height: mediaQuerySize.height * 0.2.h,
                  width: mediaQuerySize.width * 0.9.w,
                  decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(blurRadius: 4, spreadRadius: 1, offset: Offset(0, 2))]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Truck No. 200',
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
                          text1: '34-C',
                          text2: '2 Pieces',
                        ),
                        SizedBox(
                          width: mediaQuerySize.width * 0.01.w,
                        ),
                        CommonTruckIcon(
                          text1: '34-C',
                          text2: '2 Pieces',
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
                          text1: '34-C',
                          text2: '2 Pieces',
                        ),
                        SizedBox(
                          width: mediaQuerySize.width * 0.01.w,
                        ),
                        CommonTruckIcon(
                          text1: '34-C',
                          text2: '2 Pieces',
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
                          text1: '34-C',
                          text2: '2 Pieces',
                        ),
                        SizedBox(
                          width: mediaQuerySize.width * 0.01.w,
                        ),
                        CommonTruckIcon(
                          text1: '34-C',
                          text2: '2 Pieces',
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
                          text1: '34-C',
                          text2: '2 Pieces',
                        ),
                        SizedBox(
                          width: mediaQuerySize.width * 0.01.w,
                        ),
                        CommonTruckIcon(
                          text1: '34-C',
                          text2: '2 Pieces',
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
