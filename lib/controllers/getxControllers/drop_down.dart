import 'package:get/get.dart';

class DropdownController extends GetxController {
  // Observable variable to store the selected value
  var selectedValue = '1'.obs;

  // Function to update the selected value
  void setSelectedValue(String value) {
    selectedValue.value = value;
  }
}