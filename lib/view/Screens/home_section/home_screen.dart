import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_mid_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: mediaQuerySize.height.h,
        width: mediaQuerySize.width.w,
        color: AppColors.whiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03.w, vertical: mediaQuerySize.height * 0.01.h),
                child: const CommonAppBar(),
              ),
              SizedBox(height: mediaQuerySize.height * 0.035.h),
              CommonMidWidget(),
              SizedBox(height: mediaQuerySize.height * 0.035.h),
              const Text('Dashboard'),
              SizedBox(height: mediaQuerySize.height * 0.035.h),
              Wrap(
                children: List.generate(
                  title.length,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02.w, vertical: mediaQuerySize.height * 0.015),
                      child: Container(
                          width: mediaQuerySize.width * 0.4,
                          // height: mediaQuerySize.height * 0.01,
                          decoration: BoxDecoration(boxShadow: [const BoxShadow(color: Colors.black12, blurRadius: 1, spreadRadius: 1, offset: Offset(0, 0))], color: AppColors.secondoryColor, borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.045, vertical: mediaQuerySize.height * 0.03),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/images/battery_icon.png'),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: mediaQuerySize.width * 0.2,
                                      height: mediaQuerySize.height * 0.05,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          title[index],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  List<String> title = ['Battery', 'Roadside Service', 'Delivery', 'Transfer', 'Issue', 'Recieve', 'Truck Stock', 'Battery Search'];
}
