

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'package:inventory_management_app/controllers/getxControllers/drop_down.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/payment_method/delivery_completed_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
import '../widgets/common_appbar.dart';

class DeliveryPhotoScreen extends StatefulWidget {
  DeliveryPhotoScreen({super.key});

  @override
  State<DeliveryPhotoScreen> createState() => _DeliveryPhotoScreenState();
}

class _DeliveryPhotoScreenState extends State<DeliveryPhotoScreen> {
  final TextEditingController deliveryIdController = TextEditingController(text: "20092");
  final TextEditingController fullNameController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  Future<String> uploadImageToFirebase(File file) async {
    final String fileId = const Uuid().v4();
    final Reference storageRef = FirebaseStorage.instance.ref().child("delivery_photos/$fileId.jpg");
    final UploadTask uploadTask = storageRef.putFile(file);
    final TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  Future<void> saveDeliveryData() async {
    if (_imageFile == null || fullNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all fields and upload a photo")));
      return;
    }

    try {
      final imageUrl = await uploadImageToFirebase(File(_imageFile!.path));
      await FirebaseFirestore.instance.collection('deliveries').add({
        'delivery_id': deliveryIdController.text,
        'full_name': fullNameController.text,
        'image_url': imageUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delivery recorded successfully")));

      Get.to(() => DeliveryCompletedScreen());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02.w, vertical: mediaQuerySize.height * 0.02.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CommonAppBar.commonAppBar(context, scaffoldKey),
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                Text('Delivery Photo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: mediaQuerySize.width * 0.03.w),
                    child: Text('Deliver To', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(height: mediaQuerySize.height * 0.01.h),
                CustomField(
                  controller: deliveryIdController,
                  text: 'Delivery ID',
                ),
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                CustomField(
                  controller: fullNameController,
                  text: 'Full Name',
                ),
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                _imageFile != null
                    ? Image.file(File(_imageFile!.path), height: 200)
                    : Icon(Icons.image, size: 100, color: Colors.grey),
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.camera_alt),
                      label: Text('Camera'),
                      onPressed: () => pickImage(ImageSource.camera),
                    ),
                    ElevatedButton.icon(
                      icon: Icon(Icons.file_copy),
                      label: Text('Gallery'),
                      onPressed: () => pickImage(ImageSource.gallery),
                    ),
                  ],
                ),
                SizedBox(height: mediaQuerySize.height * 0.08.h),
                CustomButton(
                  onTap: saveDeliveryData,
                  name: 'Complete Delivery',
                  width: mediaQuerySize.width * 0.9.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


