import 'package:flutter/material.dart';
import 'package:inventory_management_app/controllers/utills/common_dropdown.dart';
import 'package:inventory_management_app/controllers/utills/common_widget.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';

class Login2 extends StatelessWidget {
  Login2({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar("Moessage"),
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            margin:
                EdgeInsetsDirectional.only(top: mediaQuerySize.height * 0.05),
            child: Text(
              textAlign: TextAlign.center,
              "Select your warehouse and\n station",
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
                  SizedBox(
                    height: 10,
                  ),
                  DropdownInCard(
                      selected: "Warehouse",
                      items: [
                        "Warehouse",
                      ],
                      hintText: "Category",
                      onChange: () {}),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownInCard(
                    selected: "Station",
                    items: [
                      "Station",
                    ],
                    hintText: "Category",
                    onChange: () {},
                    icon: Icons.home,
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
        ],
      )),
    );
  }
}
