import 'package:get/get.dart';

class QRScannerController extends GetxController {
  var scannedCode = ''.obs; // Observable variable to store scanned data

  void setScannedCode(String code) {
    scannedCode.value = code; // Update scanned code
  }
}
