import 'package:flutter/material.dart';
import 'package:inventory_management_app/controllers/utills/common_dropdown.dart';
import 'package:inventory_management_app/controllers/utills/common_widget.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';
import 'package:inventory_management_app/view/Screens/widgets/custom-field.dart';

class StationTruckPasscodeScreen extends StatelessWidget {
  StationTruckPasscodeScreen({super.key});

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
              "Enter your Station and Truck \n Passcode",
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
                      selected: "Station",
                      items: [
                        "Station",
                      ],
                      hintText: "Category",
                      onChange: () {}),
                  SizedBox(
                    height: 10,
                  ),
                  CustomField(text: 'Truck Passcode',isPrefixIcon: true,suffixIcon: Icon(Icons.code_outlined,color: Colors.red,),),
                 
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
                child: GestureDetector(
                  onTap: (){
                     showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Container(
                              height: mediaQuerySize.height * 0.2,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.01, vertical: mediaQuerySize.height * 0.015),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Request sent for admin approval!',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                ],
                              )),
                        ),
                      );
                  },
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
              ),
            ],
          ),
        ],
      )),
    );
  }
}
