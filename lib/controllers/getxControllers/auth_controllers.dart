
import 'package:get/get.dart';

class AuthControllers extends GetxController {
  // FirebaseAuth firebaseInstance = FirebaseAuth.instance;
  // FirebaseFirestore fireStore = FirebaseFirestore.instance;
  var isPasswordVisible = false.obs;

  var isChecked = false.obs;
  RxBool isLoading = false.obs;

  void toggleChecked() {
    isChecked.value = !isChecked.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Future<bool> signUpwithEmailandPassword({required String email, required String password, required String collectionName, required String fullName, required String phoneNumber}) async {
  //   try {
  //     isLoading.value = true;
  //     await firebaseInstance.createUserWithEmailAndPassword(email: email, password: password).then(
  //       (value) async {
  //         await fireStore.collection(collectionName).doc().set({'fullName': fullName, 'email': email, 'password': password, 'phoneNumber': phoneNumber, 'userCreated': DateTime.now()});
  //       },
  //     );
  //     isLoading.value = false;
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     isLoading.value = false;
  //     return false;
  //   }
  // }

  // Future<bool> signInWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     isLoading.value = true;
  //     await firebaseInstance.signInWithEmailAndPassword(email: email, password: password);
  //     isLoading.value = false;
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     isLoading.value = false;
  //     return false;
  //   }
  // }
}