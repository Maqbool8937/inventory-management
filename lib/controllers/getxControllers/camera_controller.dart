
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraController extends GetxController {
  final Rx<File?> capturedImage = Rx<File?>(null); // Observed image file
  final ImagePicker _picker = ImagePicker();

  // Function to capture image from the camera
  Future<void> captureImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        capturedImage.value = File(image.path); // Update the image
      } else {
        Get.snackbar("No Image", "No image was captured.");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to capture image: $e");
    }
  }
}
