import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/utils/app_colors.dart';
import '../../../controllers/utils/app_textstyles.dart';

class CommonSalesHistory extends StatelessWidget {
   CommonSalesHistory({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
                width: mediaQuerySize.width*0.9.w,
                decoration: BoxDecoration(
                  color: AppColors.secondoryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 2)
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Container(
                      width: mediaQuerySize.width.w,
                      height: mediaQuerySize.height*0.06.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.04.w,vertical: mediaQuerySize.height*0.02.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('48-x',style: AppTextstyles.simpleText(),),
                           
                            Text('12/04/24',style: AppTextstyles.simpleText()),
                          ],
                        ),
                      ),
                      
                    ),
                   // Divider(),
                   Padding(
                    padding:  EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.02.w,vertical: mediaQuerySize.height*0.02.h),
                     child: Container(
                      width: mediaQuerySize.width.w,
                      decoration: BoxDecoration(
                       
                      
                      ),
                      child: Column(
                        children: [
                       
                          _commonSalesHistory(context,'Order Number','M3418'),
                            Divider(),
                            
                          _commonSalesHistory(context,'Quantity','12'),
                           Divider(),
                          _commonSalesHistory(context,'TC','M32d'),
                          Divider(),
                          _commonSalesHistory(context,'RC','M32d'),


                        ],
                      ),
                     ),
                   ),
                   
                  ],
                ),
               );

}
Widget _commonSalesHistory(BuildContext context, String text,String text1){
  Size mediaQuerySize =  MediaQuery.of(context).size;
  return  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: mediaQuerySize.width*0.001.w,vertical: mediaQuerySize.height*0.001.h),
                     child: Container(
                      width: mediaQuerySize.width.w,
                      decoration: BoxDecoration(
                       
                      
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(text),
                                Text(text1,),
                            
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                     ),
                   );
}
}