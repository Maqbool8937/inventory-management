import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.01, vertical: mediaQuerySize.height * 0.01),
            child: Align(alignment: Alignment.topRight, child: Icon(Icons.cancel)),
          ),
          SizedBox(
            height: mediaQuerySize.height * 0.008.h,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.08),
                child: Text(
                  'Hello There!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
          SizedBox(
            height: mediaQuerySize.height * 0.02.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.06),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.primaryColor),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.euro_symbol_outlined, color: AppColors.whiteColor),
                    title: Text(
                      'MS32',
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home_filled, color: AppColors.whiteColor),
                    title: Text(
                      'WE32',
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home_outlined, color: AppColors.whiteColor),
                    title: Text(
                      '3245',
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Employee Acess'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_business),
            title: Text('Add Business'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}
