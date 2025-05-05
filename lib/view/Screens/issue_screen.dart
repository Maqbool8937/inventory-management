
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/view/Screens/issue_submitted_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

class IssueScreen extends StatefulWidget {
  const IssueScreen({super.key});

  @override
  State<IssueScreen> createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {
  final TextEditingController truckNumberController = TextEditingController();
  final TextEditingController phoneticsController = TextEditingController();

  void submitIssue() async {
    if (truckNumberController.text.isEmpty || phoneticsController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('issued_items').add({
        'truck_number': truckNumberController.text,
        'phonetics': phoneticsController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      Get.to(() => IssueSubmittedScreen());
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
                  Text('Issue',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
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
                  boxShadow: [
                    BoxShadow(blurRadius: 3, offset: Offset(0, 1)),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: truckNumberController,
                        decoration: InputDecoration(
                          hintText: 'Truck Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(height: mediaQuerySize.height * 0.01),
                      TextField(
                        controller: phoneticsController,
                        decoration: InputDecoration(
                          hintText: 'Phonetics',
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
                name: 'Add Sales Order',
                width: mediaQuerySize.width * 0.9,
              ),
              SizedBox(height: mediaQuerySize.height * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mediaQuerySize.width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('AAA no.',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    Text('Qty',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    Text('Battery',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    Text('Order',
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
                onTap: submitIssue,
                name: 'Issue',
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
