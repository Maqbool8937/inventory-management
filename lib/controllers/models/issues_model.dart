import 'package:cloud_firestore/cloud_firestore.dart';

class IssuesModel {
  String id;
  String issueType;
  String description;
  bool resolved;
  DateTime reportedAt;

  IssuesModel({
    required this.id,
    required this.issueType,
    required this.description,
    required this.resolved,
    required this.reportedAt,
  });

  factory IssuesModel.fromMap(Map<String, dynamic> map) {
    return IssuesModel(
      id: map['id'] ?? '',
      issueType: map['issueType'] ?? '',
      description: map['description'] ?? '',
      resolved: map['resolved'] ?? false,
      reportedAt: (map['reportedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'issueType': issueType,
      'description': description,
      'resolved': resolved,
      'reportedAt': reportedAt,
    };
  }
}
