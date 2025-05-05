import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/check_status/check_status1_screen.dart';
import 'package:inventory_management_app/view/Screens/transfer_section/incoming_transfer_screen.dart';
import 'package:inventory_management_app/view/Screens/transfer_section/outcoming_transfer_screen.dart';
import '../widgets/common_appbar.dart';
import '../widgets/custom-field.dart';
import '../widgets/custom_button.dart';

class TransferScreenOne extends StatelessWidget {
  TransferScreenOne({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController transferNoController = TextEditingController();

  // Function to save transfer details in Firestore
  Future<void> saveTransferData(String type) async {
    await FirebaseFirestore.instance.collection(type).add({
      'transferNo': DateTime.now().millisecondsSinceEpoch.toString(),
      'status': 'Pending',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Function to check transfer status
  Future<void> checkTransferStatus(BuildContext context) async {
    String transferNo = transferNoController.text.trim();
    
    if (transferNo.isEmpty) {
      Get.snackbar("Error", "Please enter a transfer number");
      return;
    }

    // Checking both incoming and outgoing transfers
    var incomingSnapshot = await FirebaseFirestore.instance
        .collection('incoming_transfers')
        .where('transferNo', isEqualTo: transferNo)
        .get();

    var outgoingSnapshot = await FirebaseFirestore.instance
        .collection('outgoing_transfers')
        .where('transferNo', isEqualTo: transferNo)
        .get();

    if (incomingSnapshot.docs.isNotEmpty) {
      var transferData = incomingSnapshot.docs.first.data();
      Get.to(() => CheckStatus1Screen(), arguments: transferData);
    } else if (outgoingSnapshot.docs.isNotEmpty) {
      var transferData = outgoingSnapshot.docs.first.data();
      Get.to(() => CheckStatus1Screen(), arguments: transferData);
    } else {
      Get.snackbar("Error", "Transfer not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: mediaQuerySize.height * 0.03.h,
              horizontal: mediaQuerySize.width * 0.03.w,
            ),
            child: Column(
              children: [
                SizedBox(height: mediaQuerySize.height * 0.05.h),
                _commonWidget(
                  onTap: () async {
                    await saveTransferData('incoming_transfers');
                    Get.to(() => IncomingTransferScreen());
                  },
                  context,
                  text: 'Incoming Transfers',
                  icon: Icons.forward_to_inbox_rounded,
                ),
                SizedBox(height: mediaQuerySize.height * 0.03.h),
                _commonWidget(
                  onTap: () async {
                    await saveTransferData('outgoing_transfers');
                    Get.to(() => OutcomingTransferScreen());
                  },
                  context,
                  text: 'Outgoing Transfers',
                  icon: Icons.arrow_forward_rounded,
                ),
                SizedBox(height: mediaQuerySize.height * 0.03.h),
                _commonWidget(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        contentPadding: EdgeInsets.all(0),
                        content: Container(
                          height: mediaQuerySize.height * 0.42,
                          padding: EdgeInsets.symmetric(
                            horizontal: mediaQuerySize.width * 0.02,
                            vertical: mediaQuerySize.height * 0.015,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Check Status',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () => Get.back(),
                                    icon: Icon(Icons.cancel),
                                  ),
                                ],
                              ),
                              Card(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: mediaQuerySize.width * 0.01,
                                    vertical: mediaQuerySize.height * 0.01,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Enter the transfer number to check status',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: mediaQuerySize.height * 0.02),
                                      CustomField(
                                        text: 'Transfer No.',
                                        controller: transferNoController,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: mediaQuerySize.height * 0.02),
                              CustomButton(
                                onTap: () => checkTransferStatus(context),
                                name: 'Check',
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  context,
                  text: 'Check Status',
                  icon: Icons.refresh_sharp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
              Icon(icon, color: AppColors.secondoryColor, size: 30),
            ],
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
// import 'package:inventory_management_app/view/Screens/check_status/check_status1_screen.dart';
// import 'package:inventory_management_app/view/Screens/transfer_section/incoming_transfer_screen.dart';
// import 'package:inventory_management_app/view/Screens/transfer_section/outcoming_transfer_screen.dart';
// import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
// import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

// import '../widgets/common_appbar.dart';

// class TransferScreenOne extends StatelessWidget {
//   TransferScreenOne({super.key});
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     Size mediaQuerySize = MediaQuery.of(context).size;

//     return Scaffold(
//         appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
//         body: SingleChildScrollView(
//             child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03.h, horizontal: mediaQuerySize.width * 0.03.w),
//             child: Column(children: [
//               SizedBox(
//                 height: mediaQuerySize.height * 0.03.h,
//               ),
//               SizedBox(
//                 height: mediaQuerySize.height * 0.05.h,
//               ),
//               _commonWidget(
//                 onTap: () {
//                   Get.to(() => IncomingTransferScreen());
//                 },
//                 context,
//                 text: 'Incoming Transfers',
//                 icon: Icons.forward_to_inbox_rounded,
//               ),
//               SizedBox(
//                 height: mediaQuerySize.height * 0.03.h,
//               ),
//               _commonWidget(
//                 onTap: () {
//                   Get.to(() => OutcomingTransferScreen());
//                 },
//                 context,
//                 text: 'Outgoing Transfers',
//                 icon: Icons.arrow_forward_rounded,
//               ),
//               SizedBox(
//                 height: mediaQuerySize.height * 0.03.h,
//               ),
//               _commonWidget(
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       contentPadding: EdgeInsets.all(0),
//                       content: Container(
//                           height: mediaQuerySize.height * 0.42,
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02, vertical: mediaQuerySize.height * 0.015),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Text(
//                                       'Check Status',
//                                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       width: mediaQuerySize.width * 0.1,
//                                     ),
//                                     IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
//                                   ],
//                                 ),
//                                 Card(
//                                   child: Padding(
//                                     padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.01, vertical: mediaQuerySize.height * 0.01),
//                                     child: Column(
//                                       children: [
//                                         Text(
//                                           textAlign: TextAlign.center,
//                                           'Enter the transfer number you want to check the status of',
//                                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                                         ),
//                                         SizedBox(
//                                           height: mediaQuerySize.height * 0.02,
//                                         ),
//                                         CustomField(
//                                           text: 'Transfer No.',
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: mediaQuerySize.height * 0.02,
//                                 ),
//                                 CustomButton(
//                                     onTap: () {
//                                       Get.back();
//                                       Get.to(() => CheckStatus1Screen());
//                                     },
//                                     name: 'Check')
//                               ],
//                             ),
//                           )),
//                     ),
//                   );
//                 },
//                 context,
//                 text: 'Check Status',
//                 icon: Icons.refresh_sharp,
//               ),
//             ]),
//           ),
//         )));
//   }

//   Widget _commonWidget(BuildContext context, {required String text, required IconData icon, void Function()? onTap}) {
//     Size mediaQuerySize = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: mediaQuerySize.height * 0.08,
//         width: mediaQuerySize.width * 0.9,
//         decoration: BoxDecoration(
//           color: AppColors.primaryColor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: mediaQuerySize.width * 0.03,
//             vertical: mediaQuerySize.height * 0.02,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 text,
//                 style: TextStyle(
//                   color: AppColors.secondoryColor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               Icon(
//                 icon,
//                 color: AppColors.secondoryColor,
//                 size: 30,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
