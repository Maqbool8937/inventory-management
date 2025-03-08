import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryModel {
  String id;
  String orderId;
  String deliveredBy;
  String status;
  DateTime deliveredAt;

  DeliveryModel({
    required this.id,
    required this.orderId,
    required this.deliveredBy,
    required this.status,
    required this.deliveredAt,
  });

  factory DeliveryModel.fromMap(Map<String, dynamic> map) {
    return DeliveryModel(
      id: map['id'] ?? '',
      orderId: map['orderId'] ?? '',
      deliveredBy: map['deliveredBy'] ?? '',
      status: map['status'] ?? '',
      deliveredAt: (map['deliveredAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'orderId': orderId,
      'deliveredBy': deliveredBy,
      'status': status,
      'deliveredAt': deliveredAt,
    };
  }
}
