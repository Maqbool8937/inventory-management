class BatteryData {
  String? id;
  String callId;
  String batterySize;
  double amount;
  DateTime timestamp;

  BatteryData({
    this.id,
    required this.callId,
    required this.batterySize,
    required this.amount,
    required this.timestamp,
  });

  // Convert model to Firebase-friendly format
  Map<String, dynamic> toMap() {
    return {
      'callId': callId,
      'batterySize': batterySize,
      'amount': amount,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // Convert Firebase document to BatteryData object
  factory BatteryData.fromMap(String id, Map<String, dynamic> map) {
    return BatteryData(
      id: id,
      callId: map['callId'] ?? '',
      batterySize: map['batterySize'] ?? '',
      amount: (map['amount'] ?? 0).toDouble(),
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
