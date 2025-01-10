import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/authentication/signup_screen.dart';
import 'package:inventory_management_app/view/Screens/settings_section/change_password_screen.dart';

import '../authentication/login_screen.dart';
import '../widgets/common_appbar.dart';

class SettingsOneScreen extends StatelessWidget {
  SettingsOneScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: mediaQuerySize.height * 0.03,
              horizontal: mediaQuerySize.width * 0.03,
            ),
            child: Column(
              children: [
                SizedBox(height: mediaQuerySize.height * 0.03),
                SizedBox(height: mediaQuerySize.height * 0.05),
                _commonWidget(
                  context,
                  ontap: () {
                    Get.to(() => ChangePasswordScreen());
                  },
                  text: 'Change Password',
                  icon: Icons.edit_note_outlined,
                ),
                SizedBox(height: mediaQuerySize.height * 0.03),
                _commonWidget(
                  context,
                  ontap: () {
                    _showLogoutDialog(context, mediaQuerySize);
                  },
                  text: 'Logout',
                  icon: Icons.logout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, Size mediaQuerySize) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Are you sure you\n want to logout?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: mediaQuerySize.height * 0.02),
             
           
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                     Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color:Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                     Get.to(LoginScreen());
                      // Get.to(SignupScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                    ),
                    child: Text(
                      "Confirm",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _commonWidget(
    BuildContext context, {
    required String text,
    required IconData icon,
    void Function()? ontap,
  }) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
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


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:inventory_management_app/controllers/utils/app_colors.dart';
// import 'package:inventory_management_app/view/Screens/settings_section/change_password_screen.dart';

// import '../widgets/common_appbar.dart';

// class SettingsOneScreen extends StatelessWidget {
//   SettingsOneScreen({super.key});
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
//                 ontap: () {
//                   Get.to(() => ChangePasswordScreen());
//                 },
//                 context,
//                 text: 'Change Password',
//                 icon: Icons.edit_note_outlined,
//               ),
//               SizedBox(
//                 height: mediaQuerySize.height * 0.03.h,
//               ),
//               _commonWidget(
//                 ontap: () {
//                    showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             backgroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             content: Stack(
//               children: [
             
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                        Text(
//                         "Mark Note",
//                         style: TextStyle(
//                           fontSize: mediaQuerySize.width * 0.05,
//                           fontWeight: FontWeight.bold,
//                         ),
//                        ),
                           
//                         Container(
//                     height: 30,
//                     width: 30,
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(10)
//                     ),
//                     child: GestureDetector(
//                       onTap: () => Navigator.pop(context),
//                       child: Icon(
//                         Icons.close,
//                         color: Colors.white,
//                       ),
//                     ),
//                         ),
//                       ],
//                     ),
                   
//                     SizedBox(height: mediaQuerySize.height * 0.02),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         // Add your upload image logic here
//                       },
//                       icon: Icon(Icons.upload),
//                       label: Text("Upload Image"),
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: Size(double.infinity, 50),
//                       ),
//                     ),
//                     SizedBox(height: mediaQuerySize.height * 0.02),
//                     Container(
//                       height: mediaQuerySize.height * 0.1, // Reduced height
//                       child: TextField(
//                         decoration: InputDecoration(
//                           labelText: "Mark Note",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         maxLines: 2, // Reduced max lines
//                       ),
//                     ),
//                     SizedBox(height: mediaQuerySize.height * 0.02),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             // Add your delete logic here
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.transparent,
//                           ),
//                           child: Text("Delete",style: TextStyle(color: Colors.red),),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Add your take note logic here
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red,
//                           ),
//                           child: Text("Take Note",style: TextStyle(color: Colors.white
//                           ),),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//                 },
//                 context,
//                 text: 'Logout',
//                 icon: Icons.edit_note_outlined,
//               ),
//             ]),
//           ),
//         )));
//   }

//   Widget _commonWidget(BuildContext context, {required String text, required IconData icon, void Function()? ontap}) {
//     Size mediaQuerySize = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: ontap,
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
