import 'package:flutter/material.dart';
import 'package:inventory_management_app/controllers/utills/common_textfield.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';

class ApprovalScreen extends StatelessWidget {
  ApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(
                    top: mediaQuerySize.height * 0.3,
                  ),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(35)),
                  child: Center(
                    child: Icon(
                      size: 60,
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                textAlign: TextAlign.center,
                "Request sent for admin Approval",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              child: Text(
                textAlign: TextAlign.center,
                "Your account is awaiting admin approval. You will receive a notification once your profile is activated.",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: mediaQuerySize.width * 0.2, vertical: 20),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
