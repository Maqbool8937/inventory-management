import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

import '../widgets/common_sales_history.dart';

class IncomingTransferScreen extends StatelessWidget {
  IncomingTransferScreen({super.key});
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
            child: Column(children: [
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.04.h,
              ),
              CustomButton(
                name: 'Refresh',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      contentPadding: EdgeInsets.all(0),
                      content: Container(
                          height: mediaQuerySize.height * 0.3,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02, vertical: mediaQuerySize.height * 0.015),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: mediaQuerySize.height * 0.01,
                                ),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: Icon(Icons.cancel))),
                                Text(
                                  'All Good',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: mediaQuerySize.height * 0.01,
                                ),
                                Text(
                                  'You have no pending transfers',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: mediaQuerySize.height * 0.01,
                                ),
                                CustomButton(
                                  name: 'Ok',
                                  onTap: () {
                                    Get.back();
                                  },
                                )
                              ],
                            ),
                          )),
                    ),
                  );
                },
              ),
              SizedBox(
                height: mediaQuerySize.height * 0.04.h,
              ),
              CommonSalesHistory(),
              SizedBox(
                height: mediaQuerySize.height * 0.03.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: mediaQuerySize.height * 0.04.h,
                    width: mediaQuerySize.width * 0.08.w,
                    decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.secondoryColor,
                    ),
                  ),
                ),
              )
            ]),
          ),
        )));
  }
}
