class DashboardItem {
  final String id; // Firebase Document ID
  final String title;
  final String image;
  final String route;

  DashboardItem({required this.id, required this.title, required this.image, required this.route});

  // Convert to Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'route': route,
    };
  }

  // Create from Firebase Document
  factory DashboardItem.fromMap(String id, Map<String, dynamic> map) {
    return DashboardItem(
      id: id,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      route: map['route'] ?? '',
    );
  }
}
