import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/road_side_services_3.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

class RoadSideServices2 extends StatefulWidget {
  @override
  _RoadSideServices2State createState() => _RoadSideServices2State();
}

class _RoadSideServices2State extends State<RoadSideServices2> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late Future<DocumentSnapshot> _serviceData;

  @override
  void initState() {
    super.initState();
    _serviceData = _fetchServiceData();
  }

  // Fetch roadside service details from Firestore
  Future<DocumentSnapshot> _fetchServiceData() async {
    return await firestore.collection('roadside_service_details').doc('flat_tyre').get();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SafeArea(
        child: FutureBuilder<DocumentSnapshot>(
          future: _serviceData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(child: Text("⚠️ No data available. Check Firebase."));
            }

            var serviceData = snapshot.data!.data() as Map<String, dynamic>;

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuerySize.width * 0.03.w,
                vertical: mediaQuerySize.height * 0.01.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: mediaQuerySize.height * 0.025.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          serviceData['iconUrl'] ?? 'https://via.placeholder.com/50',
                          height: 50,
                          width: 50,
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 50),
                        ),
                        SizedBox(width: mediaQuerySize.width * 0.015),
                        Text(
                          serviceData['serviceTitle'] ?? 'Unknown Service',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: mediaQuerySize.height * 0.02),
                    Card(
                      shadowColor: Colors.black,
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: mediaQuerySize.aspectRatio * 0.01.w,
                          vertical: mediaQuerySize.height * 0.02.h,
                        ),
                        child: Column(
                          children: [
                            CustomField(
                              text: serviceData['callId'] ?? 'No Call ID',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: mediaQuerySize.height * 0.02),
                    Text('Input Amount', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: mediaQuerySize.height * 0.02),
                    Card(
                      shadowColor: Colors.black,
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: mediaQuerySize.aspectRatio * 0.01.w,
                          vertical: mediaQuerySize.height * 0.02.h,
                        ),
                        child: Column(
                          children: [
                            CustomField(
                              text: serviceData['amount']?.toString() ?? '0.00',
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: mediaQuerySize.height * 0.02),
                    Container(
                      width: mediaQuerySize.width.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.gredientColor1, AppColors.gredientColor2],
                        ),
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: mediaQuerySize.height * 0.03,
                        horizontal: mediaQuerySize.width * 0.01,
                      ),
                      child: Column(
                        children: [
                          Text('Total', style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold)),
                          SizedBox(height: mediaQuerySize.height * 0.015.h),
                          Text(
                            '\$${serviceData['totalPrice']?.toStringAsFixed(2) ?? '0.00'}',
                            style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(height: mediaQuerySize.height * 0.015.h),
                          CustomButton(
                            onTap: () {
                              Get.to(() => RoadSideServices3());
                            },
                            borderColor: AppColors.whiteColor,
                            isEnabled: true,
                            name: 'Complete Payment',
                            color: Colors.transparent,
                          ),
                          SizedBox(height: mediaQuerySize.height * 0.015.h),
                          Text(
                            'plus tax, plus service charges',
                            style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:inventory_management_app/controllers/utils/app_colors.dart';
// import 'package:inventory_management_app/view/Screens/road_side_services_3.dart';
// import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
// import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
// import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

// class RoadSideServices2 extends StatelessWidget {
//   RoadSideServices2({super.key});
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
//                     height: mediaQuerySize.height * 0.025.h,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset('assets/images/tyre_icon.png'),
//                       SizedBox(
//                         width: mediaQuerySize.width * 0.015,
//                       ),
//                       Text(
//                         'Flat tyre',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       )
//                     ],
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
//                           CustomField(
//                             text: 'Call ID',
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: mediaQuerySize.height * 0.02,
//                   ),
//                   Text(
//                     'Input Amount',
//                     style: TextStyle(fontWeight: FontWeight.bold),
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
//                           CustomField(
//                             text: 'Amount',
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: mediaQuerySize.height * 0.02,
//                   ),
//                   Container(
//                     width: mediaQuerySize.width.w,
//                     decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColors.gredientColor1, AppColors.gredientColor2]), color: AppColors.primaryColor, borderRadius: BorderRadius.circular(15)),
//                     padding: EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.03, horizontal: mediaQuerySize.width * 0.01),
//                     child: Column(
//                       children: [
//                         Text(
//                           'Total',
//                           style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: mediaQuerySize.height * 0.015.h,
//                         ),
//                         Text(
//                           '\$234.67',
//                           style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 20),
//                         ),
//                         SizedBox(
//                           height: mediaQuerySize.height * 0.015.h,
//                         ),
//                         CustomButton(
//                           onTap: () {
//                             Get.to(() => RoadSideServices3());
//                           },
//                           borderColor: AppColors.whiteColor,
//                           isEnabled: true,
//                           name: 'Complete Payment',
//                           color: Colors.transparent,
//                         ),
//                         SizedBox(
//                           height: mediaQuerySize.height * 0.015.h,
//                         ),
//                         Text(
//                           'plus tax, plus service charges',
//                           style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
