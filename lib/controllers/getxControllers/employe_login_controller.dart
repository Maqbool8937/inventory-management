import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/view/Screens/home_section/home_screen.dart';

class EmployeeLoginController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Loading indicator
  var isLoading = false.obs;

  // Text field values
  var companyId = "".obs;
  var userId = "".obs;
  var name = "".obs;

  // **Login Function**
  Future<void> loginEmployee(String companyId, String userId) async {
    if (companyId.isEmpty || userId.isEmpty) {
      Get.snackbar("Error", "All fields are required!", backgroundColor: Get.theme.primaryColor);
      return;
    }

    isLoading.value = true;
    try {
      var userDoc = await _firestore.collection('employees')
          .where('companyId', isEqualTo: companyId)
          .where('userId', isEqualTo: userId)
          .get();

      if (userDoc.docs.isNotEmpty) {
        Get.snackbar("Success", "Login Successful", backgroundColor: Get.theme.primaryColor);
        Get.to(()=>HomeScreen());
      } else {
        Get.snackbar("Error", "User not found!", backgroundColor: Get.theme.primaryColor);
      }
    } catch (e) {
      Get.snackbar("Error", "Login Failed: $e", backgroundColor: Get.theme.primaryColor);
    } finally {
      isLoading.value = false;
    }
  }

  // **Add Employee Function**
  Future<void> addEmployee(String companyId, String userId, String name) async {
    if (companyId.isEmpty || userId.isEmpty || name.isEmpty) {
      Get.snackbar("Error", "All fields are required!", backgroundColor: Get.theme.primaryColor);
      return;
    }

    isLoading.value = true;
    try {
      await _firestore.collection('employees').add({
        'companyId': companyId,
        'userId': userId,
        'name': name,
        'createdAt': FieldValue.serverTimestamp(),
      });

      Get.snackbar("Success", "Employee Added Successfully", backgroundColor: Get.theme.primaryColor);
    } catch (e) {
      Get.snackbar("Error", "Failed to Add Employee: $e", backgroundColor: Get.theme.primaryColor);
    } finally {
      isLoading.value = false;
    }
  }
}
