

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/controllers/utils/app_textstyles.dart';
import 'package:inventory_management_app/view/Screens/transfer_section/scan_image.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
import 'package:inventory_management_app/view/Screens/widgets/scan_battery_widget.dart';

class OutcomingTransferScreen extends StatefulWidget {
  OutcomingTransferScreen({super.key});

  @override
  _OutcomingTransferScreenState createState() => _OutcomingTransferScreenState();
}

class _OutcomingTransferScreenState extends State<OutcomingTransferScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController truckNoController = TextEditingController();
  final TextEditingController phoneticController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void saveTransferData() async {
    if (truckNoController.text.isEmpty || phoneticController.text.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields before saving.");
      return;
    }

    try {
      await firestore.collection('outgoing_transfers').add({
        'truckNo': truckNoController.text.trim(),
        'phonetic': phoneticController.text.trim(),
        'timestamp': FieldValue.serverTimestamp(),
      });

      Get.snackbar("Success", "Transfer details saved successfully!");
      truckNoController.clear();
      phoneticController.clear();
    } catch (e) {
      Get.snackbar("Error", "Failed to save transfer: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mediaQuerySize.width * 0.03.w,
            vertical: mediaQuerySize.height * 0.01.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: mediaQuerySize.height * 0.04.h),
                Image.asset('assets/images/double_battery.png'),
                SizedBox(height: mediaQuerySize.height * 0.02),
                
                Card(
                  shadowColor: Colors.black,
                  elevation: 10,
                  borderOnForeground: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mediaQuerySize.aspectRatio * 0.01.w,
                      vertical: mediaQuerySize.height * 0.02.h,
                    ),
                    child: Column(
                      children: [
                        Text('Enter Details', style: AppTextstyles.FullBlackBoldText()),
                        SizedBox(height: mediaQuerySize.height * 0.02.h),

                        // Truck No. Input
                        CustomField(
                          text: 'Truck No.',
                          controller: truckNoController,
                        ),
                        SizedBox(height: mediaQuerySize.height * 0.02),

                        // Phonetic Input
                        CustomField(
                          isPrefixIcon: true,
                          prefixIcon: Icon(Icons.document_scanner_outlined),
                          suffixIcon: Icon(Icons.scanner),
                          text: 'Phonetic',
                          controller: phoneticController,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: mediaQuerySize.height * 0.02),

                // Scan Battery Button
                CustomButton(
                  onTap: () {
                    Get.to(() =>ScanBatteryWidget());
                  },
                  name: 'Scan Battery',
                  width: mediaQuerySize.width,
                  color: AppColors.primaryColor,
                ),

                SizedBox(height: mediaQuerySize.height * 0.02),

                // OR Text
                Center(
                  child: Text(
                    'or',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: mediaQuerySize.height * 0.02),

                // Add Manually Button (Saves to Firestore)
                GestureDetector(
                  onTap: saveTransferData,
                  child: Container(
                    height: mediaQuerySize.height * 0.07.h,
                    width: mediaQuerySize.width * 0.9.w,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Add Manually",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: mediaQuerySize.height * 0.02),

                // Back Button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: mediaQuerySize.height * 0.04.h,
                        width: mediaQuerySize.width * 0.08.w,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.secondoryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:inventory_management_app/controllers/utils/app_colors.dart';
// import 'package:inventory_management_app/controllers/utils/app_textstyles.dart';
// import 'package:inventory_management_app/view/Screens/transfer_section/scan_image.dart';
// import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
// import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
// import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

// class OutcomingTransferScreen extends StatelessWidget {
//   OutcomingTransferScreen({super.key});
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     Size mediaQuerySize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
//       body: SafeArea(
//         child: Container(
//           height: mediaQuerySize.height.h,
//           width: mediaQuerySize.width.w,
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03.w, vertical: mediaQuerySize.height * 0.01.h),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: mediaQuerySize.height * 0.04.h,
//                   ),
//                   SizedBox(
//                     height: mediaQuerySize.height * 0.025.h,
//                   ),
//                   Image.asset(
//                     'assets/images/double_battery.png',
//                   ),
//                   SizedBox(
//                     height: mediaQuerySize.height * 0.02,
//                   ),
//                   Card(
//                     shadowColor: Colors.black,
//                     elevation: 10,
//                     borderOnForeground: true,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.aspectRatio * 0.01.w, vertical: mediaQuerySize.height * 0.02.h),
//                       child: Column(
//                         children: [
//                           Text(
//                             'Enter Details',
//                             style: AppTextstyles.FullBlackBoldText(),
//                           ),
//                           SizedBox(
//                             height: mediaQuerySize.height * 0.02.h,
//                           ),
//                           CustomField(
//                             text: 'Truck No.',
//                           ),
//                           SizedBox(
//                             height: mediaQuerySize.height * 0.02,
//                           ),
//                           CustomField(
//                             isPrefixIcon: true,
//                             prefixIcon: Icon(Icons.document_scanner_outlined),
//                             suffixIcon: Icon(Icons.scanner),
//                             text: 'Phonetic',
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: mediaQuerySize.height * 0.02,
//                   ),
//                   CustomButton(
//                     onTap: () {
//                       Get.to(() => ScanImage());
//                     },
//                     name: 'Scan Battery',
//                     width: mediaQuerySize.width,
//                     color: AppColors.primaryColor,
//                   ),
//                   SizedBox(
//                     height: mediaQuerySize.height * 0.02,
//                   ),
//                   Center(
//                     child: Text('or',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
//                   ),
//                    SizedBox(
//                     height: mediaQuerySize.height * 0.02,
//                   ),
//                    Container(
//                    height: mediaQuerySize.height*0.07.h,
//                    width: mediaQuerySize.width*0.9.w,
//                      decoration: BoxDecoration(
//                          border:
//                              Border.all(width: 1, color: AppColors.primaryColor),
//                          borderRadius: BorderRadius.circular(12)),
//                      child: Center(
//                        child: Text(
//                          "Add Manually",
//                          style: TextStyle(
//                              color: AppColors.primaryColor, fontSize: 18),
//                        ),
//                      ),
//                    ),
//                     SizedBox(
//                     height: mediaQuerySize.height * 0.02,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Container(
//                         height: mediaQuerySize.height * 0.04.h,
//                         width: mediaQuerySize.width * 0.08.w,
//                         decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(15)),
//                         child: Icon(
//                           Icons.arrow_back,
//                           color: AppColors.secondoryColor,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
