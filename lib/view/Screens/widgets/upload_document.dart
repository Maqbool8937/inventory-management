import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadDocumentWidget extends StatelessWidget {
  final String text;
  final IconData icon; // Add this parameter for a customizable icon.

  const UploadDocumentWidget({
    super.key,
    required this.text,
    this.icon = Icons.upload_file, // Provide a default icon.
  });

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      height: mediaQuerySize.height * 0.09.h,
      width: mediaQuerySize.width * 0.9.w,
      decoration: BoxDecoration(
        
        color: Colors.black.withOpacity(0.07),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {
          // Add your onTap logic here.
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon, // Use the dynamic icon here.
              color: Colors.black.withOpacity(0.3),
            ),
            SizedBox(width: 8.w), // Add spacing between the icon and text.
            Text(
              text,
              style: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}