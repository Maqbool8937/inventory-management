import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/check_status/check_status1_screen.dart';
import 'package:inventory_management_app/view/Screens/transfer_section/incoming_transfer_screen.dart';
import 'package:inventory_management_app/view/Screens/transfer_section/outcoming_transfer_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
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
                onTap: () {
                  Get.to(() => IncomingTransferScreen());
                },
                context,
                text: 'Incoming Transfers',
                icon: Icons.forward_to_inbox_rounded,
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              _commonWidget(
                onTap: () {
                  Get.to(() => OutcomingTransferScreen());
                },
                context,
                text: 'Outgoing Transfers',
                icon: Icons.arrow_forward_rounded,
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              _commonWidget(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      contentPadding: EdgeInsets.all(0),
                      content: Container(
                          height: mediaQuerySize.height * 0.42,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02, vertical: mediaQuerySize.height * 0.015),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Check Status',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: mediaQuerySize.width * 0.1,
                                    ),
                                    IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
                                  ],
                                ),
                                Card(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.01, vertical: mediaQuerySize.height * 0.01),
                                    child: Column(
                                      children: [
                                        Text(
                                          textAlign: TextAlign.center,
                                          'Enter the transfer number you want to check the status of',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: mediaQuerySize.height * 0.02,
                                        ),
                                        CustomField(
                                          text: 'Transfer No.',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: mediaQuerySize.height * 0.02,
                                ),
                                CustomButton(
                                    onTap: () {
                                      Get.back();
                                      Get.to(() => CheckStatus1Screen());
                                    },
                                    name: 'Check')
                              ],
                            ),
                          )),
                    ),
                  );
                },
                context,
                text: 'Check Status',
                icon: Icons.refresh_sharp,
              ),
            ]),
          ),
        )));
  }

  Widget _commonWidget(BuildContext context, {required String text, required IconData icon, void Function()? onTap}) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
