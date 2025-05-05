import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Reactive variables for customer info
  var memberNumber = ''.obs;
  var expiryDate = ''.obs;
  var fullName = ''.obs;
  var address = ''.obs;
  var city = ''.obs;
  var state = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;

  // Save data to Firestore
  Future<void> saveCustomerInfo() async {
    try {
      await _firestore.collection('customers').add({
        'memberNumber': memberNumber.value,
        'expiryDate': expiryDate.value,
        'fullName': fullName.value,
        'address': address.value,
        'city': city.value,
        'state': state.value,
        'email': email.value,
        'phoneNumber': phoneNumber.value,
        'timestamp': FieldValue.serverTimestamp(),
      });
      Get.snackbar("Success", "Customer info saved!");
    } catch (e) {
      Get.snackbar("Error", "Failed to save data: $e");
    }
  }
}
