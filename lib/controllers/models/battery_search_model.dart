import 'package:cloud_firestore/cloud_firestore.dart';

class BatterySearchModel {
  String id;
  String searchQuery;
  String result;
  DateTime searchedAt;

  BatterySearchModel({
    required this.id,
    required this.searchQuery,
    required this.result,
    required this.searchedAt,
  });

  factory BatterySearchModel.fromMap(Map<String, dynamic> map) {
    return BatterySearchModel(
      id: map['id'] ?? '',
      searchQuery: map['searchQuery'] ?? '',
      result: map['result'] ?? '',
      searchedAt: (map['searchedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'searchQuery': searchQuery,
      'result': result,
      'searchedAt': searchedAt,
    };
  }
}
