import 'package:cloud_firestore/cloud_firestore.dart';

class BatteryModel {
  String id;
  String batterySize;
  String scanBattery;
  DateTime createdAt;

  BatteryModel({
    required this.id,
    required this.batterySize,
    required this.scanBattery,
    required this.createdAt,
  });

  factory BatteryModel.fromMap(Map<String, dynamic> map) {
    return BatteryModel(
      id: map['id'] ?? '',
      batterySize: map['batterySize'] ?? '',
      scanBattery: map['scanBattery'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'batterySize': batterySize,
      'scanBattery': scanBattery,
      'createdAt': createdAt,
    };
  }
}
