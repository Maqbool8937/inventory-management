import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/controllers/utils/app_textstyles.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';

import '../widgets/common_sales_history.dart';

class ForMoreDetailScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ForMoreDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),

      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.02.h, horizontal: mediaQuerySize.width * 0.03.w),
          child: Column(children: [
            SizedBox(
              height: mediaQuerySize.height * 0.03.h,
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.02.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02.w, vertical: mediaQuerySize.height * 0.02.h),
              child: Align(alignment: Alignment.centerLeft, child: Text('Sales History', style: AppTextstyles.NormalBlackText())),
            ),
            SizedBox(
              height: mediaQuerySize.height * 0.02.h,
            ),
            CommonSalesHistory(),
            SizedBox(
              height: mediaQuerySize.height * 0.02.h,
            ),
            CommonSalesHistory(),
            SizedBox(
              height: mediaQuerySize.height * 0.02.h,
            ),
            CommonSalesHistory(),
          ]),
        ),
      )),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
         
        },
        backgroundColor: AppColors.primaryColor, 
        child: Icon(Icons.arrow_back, color: Colors.white), 
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, 
    );
  }
}
