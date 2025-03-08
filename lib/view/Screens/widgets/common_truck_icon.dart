import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/utils/app_colors.dart';
import '../../../controllers/utils/app_textstyles.dart';

// ignore: must_be_immutable
class CommonTruckIcon extends StatelessWidget {
  String text1;
  String text2;
   CommonTruckIcon({super.key,required this.text1,required this.text2});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
                  height: mediaQuerySize.height*0.1.h,
                  width: mediaQuerySize.width*0.4.w,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                      
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: Offset(0, 0)
                      )
                    ]
                  ),
                  child: Padding(
            padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.012.h, horizontal: mediaQuerySize.width * 0.02.w),
                    child: Row(
                      children: [
                        Image.asset('assets/images/trcuk_icon.png'),
                        Spacer(),
                        Column(
                          children: [
                            Text(text1,style: AppTextstyles.FullBlackBoldText(),),
                            Text(text2,style: AppTextstyles.NormalBlackText(),)
                          ],
                        )
                      ],
                    ),
                  )
                );
  }
}