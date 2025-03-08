import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/getxControllers/scan_battery_controller.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


class ScanBatteryWidget extends StatelessWidget {
  final QRScannerController qrScannerController = Get.put(QRScannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan Battery QR Code")),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child:MobileScanner(
  //allowDuplicates: false,
  onDetect: (capture) {
    final List<Barcode> barcodes = capture.barcodes; // List of scanned barcodes
    if (barcodes.isNotEmpty) {
      final String? scannedValue = barcodes.first.rawValue; // Get the first scanned barcode value
      if (scannedValue != null) {
        qrScannerController.setScannedCode(scannedValue);
        Get.snackbar("Scanned", "Battery Code: $scannedValue");
      }
    }
  },
),),

          Expanded(
            flex: 1,
            child: Center(
              child: Obx(() => Text(
                    "Scanned Code: ${qrScannerController.scannedCode.value}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (qrScannerController.scannedCode.value.isNotEmpty) {
                Get.back(); // Return to the previous screen
              } else {
                Get.snackbar("Error", "No barcode scanned");
              }
            },
            child: Text("Done"),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
