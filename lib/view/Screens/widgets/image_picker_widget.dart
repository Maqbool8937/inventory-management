


//according to this widget am unable to access any image from camera  
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';

class ImagePickerWidget extends StatelessWidget {
  final ImageSource imageSource;
  final String buttonText;
  final IconData buttonIcon;

  ImagePickerWidget({
    Key? key,
    required this.imageSource,
    required this.buttonText,
    required this.buttonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size mediaQuerySize = MediaQuery.of(context).size;
    final Rx<File?> selectedImage = Rx<File?>(null);

    Future<void> pickImage() async {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
        print(selectedImage.value);
      }
    }

    return Obx(() {
      return selectedImage.value != null
          ? Container(
                        margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    height: mediaQuerySize.height * 0.2.h,
                    width: mediaQuerySize.width * 0.7.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: FileImage(selectedImage.value!),
                  fit: BoxFit.cover,
                ),
              ),
            )
            :GestureDetector(
              onTap: pickImage,
              child: Container(
            height: mediaQuerySize.height*0.08.h,
            width: mediaQuerySize.width*0.9.w,
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              //color: Colors.black.withOpacity(0.07),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(buttonIcon,color: Colors.white,),
                const SizedBox(width: 8),
                Text(buttonText,style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
            );
          // : ElevatedButton.icon(
          //     onPressed: pickImage,
          //     icon: Icon(buttonIcon),
          //     label: Text(buttonText),
          //   );
    });
  }
}





