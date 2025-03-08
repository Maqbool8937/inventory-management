import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/battery_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new battery
  Future<void> addBattery(BatteryModel battery) async {
    await _firestore.collection('batteries').doc(battery.id).set(battery.toMap());
  }

  // Fetch all batteries (real-time updates)
  // Stream<List<BatteryModel>> getBatteries() {
  //   return _firestore.collection('batteries').snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) => BatteryModel.fromMap(doc.data(), doc.id)).toList();
  //   });
  // }

  // Update battery status
  Future<void> updateBatteryStatus(String batteryId, String newStatus) async {
    await _firestore.collection('batteries').doc(batteryId).update({'status': newStatus});
  }

  // Delete battery
  Future<void> deleteBattery(String batteryId) async {
    await _firestore.collection('batteries').doc(batteryId).delete();
  }
}
