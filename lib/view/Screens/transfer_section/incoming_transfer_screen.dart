

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom_button.dart';

class IncomingTransferScreen extends StatelessWidget {
  IncomingTransferScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: mediaQuerySize.height * 0.02.h,
            horizontal: mediaQuerySize.width * 0.03.w,
          ),
          child: Column(
            children: [
              SizedBox(height: mediaQuerySize.height * 0.03.h),
              CustomButton(
                name: 'Refresh',
                onTap: () {
                  Get.snackbar("Refreshing...", "Updating transfer list");
                },
              ),
              SizedBox(height: mediaQuerySize.height * 0.04.h),

              // Fetch and display transfer data from Firestore
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('incoming_transfers')
                      .orderBy('timestamp', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return _noPendingTransfers(context);
                    }

                    var transferList = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: transferList.length,
                      itemBuilder: (context, index) {
                        var transferData = transferList[index].data() as Map<String, dynamic>;
                        return _transferCard(transferData);
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: mediaQuerySize.height * 0.03.h),
              _backButton(context, mediaQuerySize),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for displaying a single transfer card
  Widget _transferCard(Map<String, dynamic> data) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      elevation: 3,
      child: ListTile(
        title: Text("Transfer No: ${data['transferNo']}"),
        subtitle: Text("Status: ${data['status']}"),
        trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor),
        onTap: () {
          Get.toNamed('/checkStatus', arguments: data);
        },
      ),
    );
  }

  // Widget for "No Pending Transfers" message
  Widget _noPendingTransfers(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'All Good',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'You have no pending transfers',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Back button widget
  Widget _backButton(BuildContext context, Size mediaQuerySize) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: mediaQuerySize.height * 0.04.h,
            width: mediaQuerySize.width * 0.08.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.arrow_back,
              color: AppColors.secondoryColor,
            ),
          ),
        ),
      ),
    );
  }
}

