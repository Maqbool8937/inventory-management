import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  // TextEditingControllers for the input fields
  final TextEditingController code1 = TextEditingController();
  final TextEditingController code2 = TextEditingController();
  final TextEditingController code3 = TextEditingController();
  final TextEditingController code4 = TextEditingController();

  // Reactive list to track focus states
  final List<RxBool> focusStates = [false.obs, false.obs, false.obs, false.obs];

  // Reactive variable to track button state
  var isButtonEnabled = false.obs;

  // Validate input fields
  void validateInput() {
    isButtonEnabled.value = code1.text.isNotEmpty &&
        code2.text.isNotEmpty &&
        code3.text.isNotEmpty &&
        code4.text.isNotEmpty;
  }

  // Update focus state
  void updateFocus(int index, bool isFocused) {
    focusStates[index].value = isFocused;
  }

  // Dispose controllers when the screen is closed
  @override
  void onClose() {
    code1.dispose();
    code2.dispose();
    code3.dispose();
    code4.dispose();
    super.onClose();
  }
}