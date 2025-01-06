import 'package:flutter/material.dart';
import 'package:inventory_management_app/controllers/utills/common_dropdown.dart';
import 'package:inventory_management_app/controllers/utills/common_textfield.dart';
import 'package:inventory_management_app/controllers/utills/common_widget.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';

class AddNewScreen extends StatelessWidget {
  AddNewScreen({super.key});

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
              "Add New Screen",
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
                  buildCommonTextField("Business Name"),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownInCard(
                      selected: "Cat 1",
                      items: [
                        "Cat 1",
                        "Cat 2",
                        "Cat 3",
                      ],
                      hintText: "Category",
                      onChange: () {}),
                  //buildCommonTextField("Category"),
                  SizedBox(
                    height: 10,
                  ),
                  buildCommonTextField("Phone No."),
                  SizedBox(
                    height: 10,
                  ),
                  buildCommonTextField("Email"),
                  SizedBox(
                    height: 10,
                  ),
                  buildCommonTextField("Website"),
                  SizedBox(
                    height: 10,
                  ),
                  buildCommonTextField("Request", line: 3),
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
                      "Sent Request",
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
