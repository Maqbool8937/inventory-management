import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

class BatteryAndRoadScreen4 extends StatefulWidget {
  BatteryAndRoadScreen4({super.key});

  @override
  State<BatteryAndRoadScreen4> createState() => _BatteryAndRoadScreen4State();
}

class _BatteryAndRoadScreen4State extends State<BatteryAndRoadScreen4> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // 🔹 Controllers for TextFields
  final TextEditingController batterySizeController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController trackController = TextEditingController();

  // 🔹 Firestore Reference
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔹 Function to Send Transfer Request
  Future<void> sendTransferRequest() async {
    if (batterySizeController.text.isEmpty ||
        quantityController.text.isEmpty ||
        destinationController.text.isEmpty ||
        trackController.text.isEmpty) {
      // Show error message if fields are empty
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("All fields are required."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    try {
      await _firestore.collection("transfers").add({
        "battery_size": batterySizeController.text,
        "quantity": quantityController.text,
        "destination_no": destinationController.text,
        "track_no": trackController.text,
        "status": "pending", // Admin needs to approve
        "timestamp": FieldValue.serverTimestamp(),
      });

      // Show success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.cancel_outlined),
              ),
            ),
            content: Text(
              'Request sent for Admin Approval!',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          );
        },
      );

      // Clear fields after submission
      batterySizeController.clear();
      quantityController.clear();
      destinationController.clear();
      trackController.clear();
    } catch (e) {
      print("Error submitting request: $e");
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
              vertical: mediaQuerySize.height * 0.01.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: mediaQuerySize.height * 0.025.h),
                Image.asset('assets/images/double_battery.png'),
                SizedBox(height: mediaQuerySize.height * 0.02),
                Text('Transfer', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: mediaQuerySize.height * 0.02),
                Card(
                  shadowColor: Colors.black,
                  elevation: 10,
                  borderOnForeground: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQuerySize.aspectRatio * 0.01.w,
                        vertical: mediaQuerySize.height * 0.02.h),
                    child: Column(
                      children: [
                        CustomField(
                          controller: batterySizeController,
                          isSuffixIcon: true,
                          suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                          text: 'Battery Size',
                        ),
                        SizedBox(height: mediaQuerySize.height * 0.02),
                        CustomField(
                          controller: quantityController,
                          isSuffixIcon: true,
                          suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                          text: 'Quantity',
                        ),
                        SizedBox(height: mediaQuerySize.height * 0.02),
                        CustomField(
                          controller: destinationController,
                          text: 'Destination No.',
                        ),
                        SizedBox(height: mediaQuerySize.height * 0.02),
                        CustomField(
                          controller: trackController,
                          text: 'Track No.',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: mediaQuerySize.height * 0.02),
                CustomButton(
                  onTap: sendTransferRequest, // 🔹 Call Firestore function
                  width: mediaQuerySize.width,
                  name: 'Request Transfer',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
