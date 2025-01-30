import 'package:get/get.dart';

class RoleController extends GetxController {
  var selectedRole = "".obs;

  RoleController({required String initialRole}) {
    selectedRole.value = initialRole; // Set initial role
  }

  void setRole(String? role) {
    if (role != null) {
      selectedRole.value = role;
    }
  }
}

