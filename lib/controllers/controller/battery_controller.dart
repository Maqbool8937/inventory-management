import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/battery_model.dart';

class BatteryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var isLoading = false.obs;
  var batteryDataList = <BatteryData>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBatteryData();
  }

  // **Fetch Battery Data**
  void fetchBatteryData() async {
    try {
      isLoading(true);
      var snapshot = await _firestore.collection('battery_data').get();
      batteryDataList.value = snapshot.docs
          .map((doc) => BatteryData.fromMap(doc.id, doc.data()))
          .toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load battery data');
    } finally {
      isLoading(false);
    }
  }

  // **Add Battery Data to Firestore**
  Future<void> addBatteryData(String callId, String batterySize, double amount) async {
    try {
      isLoading(true);
      BatteryData newBattery = BatteryData(
        callId: callId,
        batterySize: batterySize,
        amount: amount,
        timestamp: DateTime.now(),
      );

      await _firestore.collection('battery_data').add(newBattery.toMap());
      fetchBatteryData(); // Refresh list
      Get.snackbar('Success', 'Battery data saved successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save battery data');
    } finally {
      isLoading(false);
    }
  }
}
