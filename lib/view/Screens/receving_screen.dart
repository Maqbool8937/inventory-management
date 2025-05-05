
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/view/Screens/battery_received_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/camera_capture.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

class ReceivingScreen extends StatefulWidget {
  const ReceivingScreen({super.key});

  @override
  State<ReceivingScreen> createState() => _ReceivingScreenState();
}

class _ReceivingScreenState extends State<ReceivingScreen> {
  final TextEditingController invoiceController = TextEditingController();
  final String date = DateTime.now().toString().split(' ')[0]; // current date

  void submitToFirebase() async {
    if (invoiceController.text.isEmpty) {
      Get.snackbar("Error", "Please enter invoice number");
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('received_batteries').add({
        'date': date,
        'invoice_number': invoiceController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      Get.to(() => BatteryReceivedScreen());
    } catch (e) {
      Get.snackbar("Error", "Failed to submit: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: mediaQuerySize.height * 0.1),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset('assets/images/aar.png'),
                  ),
                  SizedBox(width: mediaQuerySize.width * 0.27),
                  Text(
                    'Receiving',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: mediaQuerySize.height * 0.04),
              Image.asset('assets/images/double_battery.png'),
              SizedBox(height: mediaQuerySize.height * 0.03),
              Container(
                height: mediaQuerySize.height * 0.2,
                width: mediaQuerySize.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 3, offset: Offset(0, 1))],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomField(text: date),
                      SizedBox(height: mediaQuerySize.height * 0.01),
                      TextField(
                        controller: invoiceController,
                        decoration: InputDecoration(
                          hintText: "Invoice Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: mediaQuerySize.height * 0.05),
              CustomButton(
                onTap: () {
                  Get.to(() => CameraCaptureWidget());
                },
                name: 'Add Battery',
                width: mediaQuerySize.width * 0.9,
              ),
              SizedBox(height: mediaQuerySize.height * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mediaQuerySize.width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Pro',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    Text('Wrnty',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    Text('AU',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    Text('Battery',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              SizedBox(height: mediaQuerySize.height * 0.03),
              Container(
                height: mediaQuerySize.height * 0.25,
                width: mediaQuerySize.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 3)],
                ),
              ),
              SizedBox(height: mediaQuerySize.height * 0.03),
              CustomButton(
                onTap: submitToFirebase,
                name: 'Submit Receiving',
                width: mediaQuerySize.width * 0.9,
              ),
              SizedBox(height: mediaQuerySize.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}


