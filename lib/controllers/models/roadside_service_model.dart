import 'package:cloud_firestore/cloud_firestore.dart';

class RoadsideServicesModel {
  String id;
  String serviceType;
  String location;
  DateTime requestedAt;

  RoadsideServicesModel({
    required this.id,
    required this.serviceType,
    required this.location,
    required this.requestedAt,
  });

  factory RoadsideServicesModel.fromMap(Map<String, dynamic> map) {
    return RoadsideServicesModel(
      id: map['id'] ?? '',
      serviceType: map['serviceType'] ?? '',
      location: map['location'] ?? '',
      requestedAt: (map['requestedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'serviceType': serviceType,
      'location': location,
      'requestedAt': requestedAt,
    };
  }
}
