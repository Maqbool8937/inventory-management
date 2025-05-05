

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/view/Screens/road_side_services_2.dart';
import 'package:inventory_management_app/view/Screens/updated_screen.dart/gas_screen.dart';
import 'package:inventory_management_app/view/Screens/updated_screen.dart/impound_release.dart';
import 'package:inventory_management_app/view/Screens/updated_screen.dart/jump_start.dart';
import 'package:inventory_management_app/view/Screens/updated_screen.dart/lockout_screen.dart';
import 'package:inventory_management_app/view/Screens/updated_screen.dart/mechanic_shop.dart';
import 'package:inventory_management_app/view/Screens/updated_screen.dart/other_job.dart';
import 'package:inventory_management_app/view/Screens/updated_screen.dart/tow_screen.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';

class RoadSideServices extends StatefulWidget {
  const RoadSideServices({super.key});

  @override
  State<RoadSideServices> createState() => _RoadSideServicesState();
}

class _RoadSideServicesState extends State<RoadSideServices> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Stream<List<Map<String, dynamic>>> getRoadsideServices() {
    return FirebaseFirestore.instance.collection('roadside_services').snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) {
          final data = doc.data();
          return {
            'id': doc.id,
            'title': data['title'] ?? 'Unknown',
            'image': data['image'] ?? '',
            'index': data['index'] ?? 0, // Optional: For better control
          };
        }).toList();
      },
    );
  }

  void navigateToScreenByIndex(int index, Map<String, dynamic> data) {
    switch (index) {
      case 0:
        Get.to(() => RoadSideServices2());
        case 1:
        Get.to(() => OtherJob());
        case 2:
        Get.to(() => TowScreen());
        case 3:
        Get.to(() => JumpStart());
        case 4:
        Get.to(() => ImpoundRelease());
        case 5:
        Get.to(() => LockoutScreen());
        case 6:
        Get.to(() => GasScreen());
         case 7:
        Get.to(() => OtherJob());
        break;
      // Add more cases if more screens need to be navigated
      default:
        Get.snackbar("Coming Soon", "This service is under development");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mediaQuerySize.width * 0.03.w,
            vertical: mediaQuerySize.height * 0.01.h,
          ),
          child: Column(
            children: [
              SizedBox(height: mediaQuerySize.height * 0.035.h),
              Text('Roadside Services', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: mediaQuerySize.height * 0.02),

              Expanded(
                child: StreamBuilder<List<Map<String, dynamic>>>(
                  stream: getRoadsideServices(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("Error loading services"));
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text("⚠️ No roadside services available. Check Firebase data."));
                    }

                    final services = snapshot.data!;

                    return GridView.builder(
                      itemCount: services.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        final service = services[index];

                        return GestureDetector(
                          onTap: () => navigateToScreenByIndex(index, service),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    service['image'],
                                    height: 40,
                                    width: 40,
                                    errorBuilder: (context, error, stackTrace) =>
                                        const Icon(Icons.broken_image, size: 40),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    service['title'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

