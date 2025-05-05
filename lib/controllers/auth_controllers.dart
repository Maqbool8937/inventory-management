
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthControllers extends GetxController {
  FirebaseAuth firebaseInstance = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  var isPasswordVisible = false.obs;
  var isChecked = false.obs;
  RxBool isLoading = false.obs;

  void toggleChecked() {
    isChecked.value = !isChecked.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// ✅ **Sign-Up with Email & Password**
  Future<bool> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      isLoading.value = true;

      UserCredential userCredential = await firebaseInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid; // Get UID of authenticated user

      // ✅ Save user details securely in Firestore
      await fireStore.collection("users").doc(uid).set({
        'uid': uid,
        'fullName': fullName,
        'email': email,
        'phoneNumber': phoneNumber,
        'userCreated': DateTime.now(),
      });

      isLoading.value = false;
      return true;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Sign-Up Error", e.toString());
      return false;
    }
  }

  /// ✅ **Sign-In with Email & Password**
  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      await firebaseInstance.signInWithEmailAndPassword(email: email, password: password);
      isLoading.value = false;
      return true;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Login Failed", e.toString());
      return false;
    }
  }

  /// ✅ **Password Reset**
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      isLoading.value = true;
      await firebaseInstance.sendPasswordResetEmail(email: email);
      isLoading.value = false;
      Get.snackbar("Success", "Password reset link sent to your email.");
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Reset Failed", e.toString());
    }
  }

  /// ✅ **Google Sign-In**
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await firebaseInstance.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        // ✅ Check if user exists in Firestore
        DocumentSnapshot userDoc = await fireStore.collection("users").doc(user.uid).get();
        if (!userDoc.exists) {
          // ✅ If new user, store details
          await fireStore.collection("users").doc(user.uid).set({
            'uid': user.uid,
            'fullName': user.displayName ?? "Google User",
            'email': user.email,
            'phoneNumber': user.phoneNumber ?? "",
            'userCreated': DateTime.now(),
          });
        }
      }

      return user;
    } catch (e) {
      Get.snackbar("Google Sign-In Failed", e.toString());
      return null;
    }
  }

  /// ✅ **Sign-Out**
  Future<void> signOut() async {
    try {
      await firebaseInstance.signOut(); // Sign out Firebase authentication
      await _googleSignIn.signOut(); // Sign out Google user
      Get.snackbar("Success", "Signed out successfully.");
    } catch (e) {
      Get.snackbar("Sign-Out Failed", e.toString());
    }
  }
}
