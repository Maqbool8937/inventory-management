import 'package:cloud_firestore/cloud_firestore.dart';

class TruckStockModel {
  String id;
  String truckId;
  List<String> stockItems;
  DateTime updatedAt;

  TruckStockModel({
    required this.id,
    required this.truckId,
    required this.stockItems,
    required this.updatedAt,
  });

  factory TruckStockModel.fromMap(Map<String, dynamic> map) {
    return TruckStockModel(
      id: map['id'] ?? '',
      truckId: map['truckId'] ?? '',
      stockItems: List<String>.from(map['stockItems'] ?? []),
      updatedAt: (map['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'truckId': truckId,
      'stockItems': stockItems,
      'updatedAt': updatedAt,
    };
  }
}
