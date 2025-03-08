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

  Future<bool> signUpwithEmailandPassword({
    required String email,
    required String password,
    required String collectionName,
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      isLoading.value = true;
      await firebaseInstance.createUserWithEmailAndPassword(email: email, password: password).then(
        (value) async {
          await fireStore.collection(collectionName).doc().set({
            'fullName': fullName,
            'email': email,
            'password': password,
            'phoneNumber': phoneNumber,
            'userCreated': DateTime.now(),
          });
        },
      );
      isLoading.value = false;
      return true;
    } catch (e) {
      print(e);
      isLoading.value = false;
      return false;
    }
  }

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
      print(e);
      isLoading.value = false;
      return false;
    }
  }

  // Send a password reset email
  Future<void> sendPasswordResetEmail(String email, BuildContext context) async {
    try {
      isLoading.value = true;
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'user-not-found') {
        print("No user found for that email.");
      } else {
        if (Get.isSnackbarOpen) {
          Get.back();
        }
        Get.showSnackbar(GetBar(
          message: e.message.toString(),
        ));
      }
    }
  }

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
      return userCredential.user;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  // Sign out function for both Google and Email/Password users
  Future<void> signOut() async {
    try {
      if (firebaseInstance.currentUser != null) {
        await firebaseInstance.signOut(); // Sign out Firebase authentication
      }
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut(); // Sign out Google user
      }
      print("User signed out successfully.");
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
