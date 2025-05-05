import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PaymentCOntroll extends GetxController {
  var fullName = ''.obs;
  var cardNumber = ''.obs;
  var expirationDate = ''.obs;
  var cvv = ''.obs;
  var address = ''.obs;
  var isLoading = false.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// **🔹 Store Payment Details**
  Future<void> savePaymentDetails() async {
    try {
      isLoading.value = true;
      await firestore.collection('payments').add({
        "full_name": fullName.value,
        "card_number": cardNumber.value,
        "expiration_date": expirationDate.value,
        "cvv": cvv.value,
        "address": address.value,
        "timestamp": FieldValue.serverTimestamp(),
      });
      Get.snackbar("Success", "Payment details saved!");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
