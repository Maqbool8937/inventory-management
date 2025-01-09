import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/controllers/utils/app_textstyles.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

import '../widgets/common_appbar.dart';

class TransferScreenOne extends StatelessWidget {
  TransferScreenOne({super.key});
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
            child: Column(children: [
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.05.h,
              ),
              _commonWidget(
                context,
                text: 'Incoming Transfers',
                icon: Icons.forward_to_inbox_rounded,
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              _commonWidget(
                context,
                text: 'Outgoing Transfers',
                icon: Icons.arrow_forward_rounded,
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              _commonWidget(
                context,
                text: 'Check Status',
                icon: Icons.refresh_sharp,
              ),
            ]),
          ),
        )));
  }

  Widget _commonWidget(BuildContext context, {required String text, required IconData icon}) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      height: mediaQuerySize.height * 0.08,
      width: mediaQuerySize.width * 0.9,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mediaQuerySize.width * 0.03,
          vertical: mediaQuerySize.height * 0.02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: AppColors.secondoryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Icon(
              icon,
              color: AppColors.secondoryColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
