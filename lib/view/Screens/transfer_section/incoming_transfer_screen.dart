import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/controllers/utils/app_textstyles.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

import '../widgets/common_mid_widget.dart';
import '../widgets/common_sales_history.dart';

class IncomingTransferScreen extends StatelessWidget {
  const IncomingTransferScreen({super.key});

 @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.02.h, horizontal: mediaQuerySize.width * 0.03.w),
            child: Column(
             children: [
              SizedBox(height: mediaQuerySize.height*0.03.h,),
              CommonAppBar(),
              SizedBox(height: mediaQuerySize.height*0.04.h,),
              CustomButton(name: 'Refresh'),
               SizedBox(height: mediaQuerySize.height*0.04.h,),
               CommonSalesHistory(),
                 SizedBox(height: mediaQuerySize.height*0.03.h,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                            height: mediaQuerySize.height*0.04.h,
                            width: mediaQuerySize.width*0.08.w,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Icon(Icons.arrow_back,color: AppColors.secondoryColor,),
                          ),
                    ),
                  )

           ] ),
          ),
        )));
  }
}