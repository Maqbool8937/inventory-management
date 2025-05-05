import 'package:flutter/material.dart';

class CustomerField extends StatelessWidget {
  final String? text;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomerField({
    Key? key,
    this.text,
    this.controller,
    this.onChanged,
  }) : super(key: key); // ✅ Pass key to parent

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged, // ✅ Update state when text changes
      decoration: InputDecoration(
        hintText: text,
        border: OutlineInputBorder(),
      ),
    );
  }
}
