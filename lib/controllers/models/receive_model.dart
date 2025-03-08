import 'package:cloud_firestore/cloud_firestore.dart';

class ReceiveModel {
  String id;
  String itemName;
  int quantity;
  String receivedBy;
  DateTime receivedAt;

  ReceiveModel({
    required this.id,
    required this.itemName,
    required this.quantity,
    required this.receivedBy,
    required this.receivedAt,
  });

  factory ReceiveModel.fromMap(Map<String, dynamic> map) {
    return ReceiveModel(
      id: map['id'] ?? '',
      itemName: map['itemName'] ?? '',
      quantity: map['quantity'] ?? 0,
      receivedBy: map['receivedBy'] ?? '',
      receivedAt: (map['receivedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemName': itemName,
      'quantity': quantity,
      'receivedBy': receivedBy,
      'receivedAt': receivedAt,
    };
  }
}
