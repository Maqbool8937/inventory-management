import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewController extends GetxController {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController requestTextController = TextEditingController();

  RxString category = "Cat 1".obs; // Default category
  RxBool isLoading = false.obs;

  /// **Function to Add Data to Firebase**
  Future<void> addNewEntry() async {
    if (businessNameController.text.isEmpty ||
        phoneNoController.text.isEmpty ||
        emailController.text.isEmpty ||
        websiteController.text.isEmpty ||
        requestTextController.text.isEmpty) {
      Get.snackbar("Error", "All fields are required!", backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    try {
      isLoading.value = true;

      await FirebaseFirestore.instance.collection('businesses').add({
        'business_name': businessNameController.text.trim(),
        'category': category.value,
        'phone_no': phoneNoController.text.trim(),
        'email': emailController.text.trim(),
        'website': websiteController.text.trim(),
        'request_text': requestTextController.text.trim(),
        'timestamp': FieldValue.serverTimestamp(),
      });

      Get.snackbar("Success", "Request Submitted Successfully!", backgroundColor: Colors.green, colorText: Colors.white);
      
      // **Clear fields after submission**
      businessNameController.clear();
      phoneNoController.clear();
      emailController.clear();
      websiteController.clear();
      requestTextController.clear();
    } catch (e) {
      Get.snackbar("Error", "Something went wrong!", backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}
