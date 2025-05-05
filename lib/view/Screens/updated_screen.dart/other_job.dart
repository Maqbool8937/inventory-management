
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

// services/firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> submitOtherJob({required String description, required String amount}) async {
    try {
      await _db.collection('other_jobs').add({
        'description': description,
        'amount': amount,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Error saving job: $e');
    }
  }
}



class OtherJob extends StatefulWidget {
  const OtherJob({super.key});

  @override
  State<OtherJob> createState() => _OtherJobState();
}

class _OtherJobState extends State<OtherJob> {
  final TextEditingController jobDescriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();
  bool isLoading = false;

  void _submitJob() async {
    if (jobDescriptionController.text.isEmpty || amountController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }

    setState(() => isLoading = true);

    try {
      await _firestoreService.submitOtherJob(
        description: jobDescriptionController.text.trim(),
        amount: amountController.text.trim(),
      );

      Get.snackbar('Success', 'Job Submitted Successfully');
      jobDescriptionController.clear();
      amountController.clear();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      setState(() => isLoading = false);
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset('assets/images/aar.png'),
                  ),
                ),
              ),
              SizedBox(height: mediaQuerySize.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/more_icon.png'),
                  SizedBox(width: mediaQuerySize.width * 0.03),
                  Text('Other Job', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                ],
              ),
              SizedBox(height: mediaQuerySize.height * 0.03),
              Container(
                width: mediaQuerySize.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 3, offset: Offset(0, 1))],
                ),
                child: Column(
                  children: [
                    SizedBox(height: mediaQuerySize.height * 0.02),
                    Center(child: Text('Information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                    SizedBox(height: mediaQuerySize.height * 0.03),
                    CustomField(
                      controller: jobDescriptionController,
                      text: 'Job Description',
                    ),
                    SizedBox(height: mediaQuerySize.height * 0.02),
                  ],
                ),
              ),
              SizedBox(height: mediaQuerySize.height * 0.02),
              Center(child: Text('Input Amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
              SizedBox(height: mediaQuerySize.height * 0.02),
              Container(
                height: mediaQuerySize.height * 0.1,
                width: mediaQuerySize.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 3, offset: Offset(0, 1))],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomField(
                    controller: amountController,
                    text: 'Amount',
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
                      '\$${amountController.text.isEmpty ? '0.00' : amountController.text}',
                      style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: mediaQuerySize.height * 0.015.h),
                    CustomButton(
                      onTap: isLoading ? null : _submitJob,
                      borderColor: AppColors.whiteColor,
                      isEnabled: true,
                      name: isLoading ? 'Saving...' : 'Complete Payment',
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
              SizedBox(height: mediaQuerySize.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
