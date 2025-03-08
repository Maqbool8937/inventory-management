
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';

import '../../../controllers/getxControllers/camera_controller.dart';

class CameraCaptureWidget extends StatelessWidget {
  final CameraController _cameraController = Get.put(CameraController());

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min, // Ensure it doesn't take infinite height
      children: [
        // Display the captured image
        Obx(() {
          return _cameraController.capturedImage.value != null
              ? Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  height: mediaQuerySize.height * 0.15.h,
                  width: mediaQuerySize.width * 0.7.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(_cameraController.capturedImage.value!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: _cameraController.captureImage,
                  child: Container(
                    height: mediaQuerySize.height * 0.08.h,
                    width: mediaQuerySize.width * 0.9.w,
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      //color: Colors.black.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Take a Photo",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
        }),
      ],
    );
  }
}