import 'package:flutter/material.dart';
import 'package:inventory_management_app/controllers/utills/app_colors.dart';
import 'package:inventory_management_app/controllers/utills/common_textfield.dart';

class LoginAsEmployee extends StatelessWidget {
  LoginAsEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            margin:
                EdgeInsetsDirectional.only(top: mediaQuerySize.height * 0.2),
            child: Text(
              textAlign: TextAlign.center,
              "Login As Employee",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  buildCommonTextField("Company ID"),
                  SizedBox(
                    height: 10,
                  ),
                  buildCommonTextField("User ID"),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
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
          Text(
            textAlign: TextAlign.center,
            "Or",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      "Request to be an Employee",
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
