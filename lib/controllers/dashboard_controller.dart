import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'models/dashboard_model.dart';

class DashboardController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var dashboardItems = <DashboardItem>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchDashboardItems();
    super.onInit();
  }

  // Fetch data from Firebase
  void fetchDashboardItems() async {
    try {
      isLoading(true);
      var snapshot = await _firestore.collection('dashboard_items').get();
      dashboardItems.value = snapshot.docs
          .map((doc) => DashboardItem.fromMap(doc.id, doc.data()))
          .toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load data');
    } finally {
      isLoading(false);
    }
  }

  // Add Data to Firebase
  Future<void> addDashboardItems() async {
    List<DashboardItem> items = [
      DashboardItem(id: '', title: 'Battery', image: 'assets/images/battery_icon.png', route: 'BatteryScreen2'),
      DashboardItem(id: '', title: 'Roadside Service', image: 'assets/images/road_side_icon.png', route: 'RoadSideServices'),
      DashboardItem(id: '', title: 'Truck Stock', image: 'assets/images/truck_stock_icon.png', route: 'TruckScreen'),
      DashboardItem(id: '', title: 'Battery Search', image: 'assets/images/battery_search_icon.png', route: 'BatterySearchScreen'),
      DashboardItem(id: '', title: 'Issue', image: 'assets/images/⚠️.png', route: 'BatterySearchScreen'),
     DashboardItem(id: '', title: 'Roadside Service', image: 'assets/images/road_side_icon.png', route: 'RoadSideServices'),
          DashboardItem(id: '', title: 'Roadside Service', image: 'assets/images/road_side_icon.png', route: 'RoadSideServices'),


    ];

    for (var item in items) {
      await _firestore.collection('dashboard_items').add(item.toMap());
    }
    fetchDashboardItems(); // Refresh after adding
  }
}
