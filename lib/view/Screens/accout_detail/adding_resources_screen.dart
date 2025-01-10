import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/controllers/utils/app_textstyles.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

import '../widgets/common_mid_widget.dart';

class AddingResourcesScreen extends StatelessWidget {
  AddingResourcesScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.02.h, horizontal: mediaQuerySize.width * 0.03.w),
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                CommonMidWidget(),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Container(
                  height: mediaQuerySize.height * 0.15.h,
                  width: mediaQuerySize.width * 0.95.w,
                  decoration: BoxDecoration(color: AppColors.secondoryColor, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(blurRadius: 4, spreadRadius: 1)]),
                  child: Row(
                    children: [
                      _commonContainer(context,
                          topChild: Text(
                            '#',
                            style: TextStyle(
                              fontSize: 24, // Adjust size
                              fontWeight: FontWeight.bold, // Adjust weight
                              color: Colors.white, // Adjust color
                            ),
                          ),
                          bottomChild: Text(
                            'MS32',
                            style: AppTextstyles.simpleText(),
                          )),
                      _commonContainer(context,
                          topChild: Icon(
                            Icons.home_work_outlined,
                            color: AppColors.secondoryColor,
                          ),
                          bottomChild: Text('MS32', style: AppTextstyles.simpleText())),
                      _commonContainer(context,
                          topChild: Icon(
                            Icons.home,
                            color: AppColors.secondoryColor,
                          ),
                          bottomChild: Text('MS32', style: AppTextstyles.simpleText()))
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Center(
                  child: Text(
                    'Sales History',
                    style: AppTextstyles.BoldBlackText(),
                  ),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.03.h,
                ),
                Container(
                  width: mediaQuerySize.width * 0.9.w,
                  decoration: BoxDecoration(color: AppColors.secondoryColor, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(blurRadius: 3, spreadRadius: 1, offset: Offset(0, 2))]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: mediaQuerySize.height * 0.02.h,
                      ),
                      _commonSalesRow(context),
                      SizedBox(
                        height: mediaQuerySize.height * 0.02.h,
                      ),
                      _commonSalesRow(context),
                      SizedBox(
                        height: mediaQuerySize.height * 0.02.h,
                      ),
                      _commonSalesRow(context),
                      SizedBox(
                        height: mediaQuerySize.height * 0.02.h,
                      ),
                      CustomButton(name: 'View All'),
                      SizedBox(
                        height: mediaQuerySize.height * 0.02.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _commonContainer(BuildContext context, {Widget? topChild, Widget? bottomChild}) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mediaQuerySize.width * 0.02, // Adjust padding as needed
        vertical: mediaQuerySize.height * 0.03,
      ),
      child: Container(
        height: mediaQuerySize.height * 0.1,
        width: mediaQuerySize.width * 0.27,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryColor, // Ensure this is defined in your project
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: topChild ?? SizedBox()), // Top widget (flexible)
              bottomChild ?? SizedBox(), // Bottom widget (text, icon, etc.)
            ],
          ),
        ),
      ),
    );
  }

  Widget _commonSalesRow(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      height: mediaQuerySize.height * 0.08.h,
      width: mediaQuerySize.width * 0.83.w,
      decoration: BoxDecoration(color: AppColors.shadowColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('48-x'),
          Text('12/04/24'),
          Container(
            height: mediaQuerySize.height * 0.04.h,
            width: mediaQuerySize.width * 0.08.w,
            decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(15)),
            child: Icon(
              Icons.arrow_forward,
              color: AppColors.secondoryColor,
            ),
          )
        ],
      ),
    );
  }
}
