import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/controllers/utils/app_textstyles.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';
import '../widgets/common_appbar.dart';
import '../widgets/common_truck_icon.dart';

class TruckScreen extends StatefulWidget {
  TruckScreen({super.key});

  @override
  _TruckScreenState createState() => _TruckScreenState();
}

class _TruckScreenState extends State<TruckScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? selectedCapacity;

  @override
  void initState() {
    super.initState();
    _addTruckData(); // Add dummy truck data
  }

  // Function to add sample truck data to Firestore
  Future<void> _addTruckData() async {
    CollectionReference trucks = firestore.collection('trucks');

    List<Map<String, dynamic>> sampleData = [
      {"truckNumber": "200", "capacity": "200", "batteries": 16},
      {"truckNumber": "300", "capacity": "300", "batteries": 20},
      {"truckNumber": "400", "capacity": "400", "batteries": 12},
      {"truckNumber": "500", "capacity": "500", "batteries": 18},
    ];

    for (var truck in sampleData) {
      await trucks.doc(truck['truckNumber']).set(truck);
    }
    print("✅ Truck data added to Firestore");
  }

  // Fetch trucks dynamically from Firestore
  Stream<QuerySnapshot> getTrucks() {
    Query query = firestore.collection('trucks');

    if (selectedCapacity != null) {
      query = query.where("capacity", isEqualTo: selectedCapacity);
    }

    return query.snapshots();
  }

  // Show filter dialog
  void showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Filter Trucks", style: TextStyle(fontWeight: FontWeight.bold)),
        content: DropdownButtonFormField<String>(
          decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Select Capacity"),
          value: selectedCapacity,
          items: ["200", "300", "400", "500", "600"].map((String value) {
            return DropdownMenuItem(value: value, child: Text(value));
          }).toList(),
          onChanged: (value) {
            setState(() => selectedCapacity = value);
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() => selectedCapacity = null);
              Navigator.pop(context);
            },
            child: Text("Reset"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              CustomButton(name: 'Filter Trucks', onTap: showFilterDialog),
              SizedBox(height: 20.h),

              // Wrap with Expanded to prevent overflow
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: getTrucks(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text("No Trucks Available"));
                    }

                    return ListView.builder(
                      shrinkWrap: true, // Ensures it doesn't take infinite height
                      physics: BouncingScrollPhysics(), // Smooth scrolling
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var truck = snapshot.data!.docs[index].data() as Map<String, dynamic>;

                        return Card(
                          elevation: 5,
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          child: Padding(
                            padding: EdgeInsets.all(12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text("Truck No. ${truck['truckNumber']}", style: AppTextstyles.BoldBlackText()),
                                                                    
                                                                      Text("Batteries: ${truck['batteries']}", style: TextStyle(fontSize: 14.sp)),
                                        
                                  
                                   
                                   
                                  ],
                                ),
                                   CommonTruckIcon(text1: truck['capacity'], text2: "Capacity")
                              ],
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

