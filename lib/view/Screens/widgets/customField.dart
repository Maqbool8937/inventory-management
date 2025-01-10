import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatelessWidget {
  final bool isPrefixIcon;
  final bool isSuffixIcon;
  final bool isPasswordField;
  final bool isObscured;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? color;
  final String? Function(String?)? validator;
  final String? text;
  final TextEditingController? controller;
  bool? isReadOnly = false;
  int? maxLines = 1;
  final TextInputType textInputType;

  CustomField({super.key, this.maxLines, this.isReadOnly, this.text, this.suffixIcon, this.isPrefixIcon = false, this.isSuffixIcon = false, this.isPasswordField = false, this.isObscured = false, this.prefixIcon, this.color, this.validator, this.controller, this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02.w),
      child: TextFormField(
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        readOnly: isReadOnly ?? false,
        controller: controller,
        obscureText: isPasswordField ? isObscured : false,
        validator: validator,
        decoration: InputDecoration(
          fillColor: color ?? Colors.black.withOpacity(0.07),
          filled: true,
          prefixIcon: isPrefixIcon ? prefixIcon : null,
          suffixIcon: isSuffixIcon ? suffixIcon : const SizedBox(),
          contentPadding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.04.w, vertical: mediaQuerySize.height * 0.025.h),
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(mediaQuerySize.width * 0.03.w), // Rounded corners
            borderSide: BorderSide.none, // Removes the border line
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(mediaQuerySize.width * 0.03.w), // Rounded corners
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(mediaQuerySize.width * 0.03.w), // Rounded corners
              borderSide: BorderSide.none),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
