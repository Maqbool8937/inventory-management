
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../Screens/widgets/all_members_widget.dart';
import '../Screens/widgets/common_appbar.dart';
class AllMemberScreen extends StatefulWidget {
  AllMemberScreen({super.key});

  @override
  State<AllMemberScreen> createState() => _AllMemberScreenState();
}

class _AllMemberScreenState extends State<AllMemberScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: mediaQuerySize.height * 0.03.h,
              horizontal: mediaQuerySize.width * 0.05.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: mediaQuerySize.height * 0.06.h),
                Text('All Members', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                SizedBox(height: mediaQuerySize.height * 0.02.h),
                AllMembersWidget(name: "John Wick", initialRole: "Employee", ),
                SizedBox(height: mediaQuerySize.height * 0.02.h),

                AllMembersWidget(name: "Alice Smith", initialRole: "Manager", ),
                SizedBox(height: mediaQuerySize.height * 0.02.h),

                AllMembersWidget(name: "Bob Johnson", initialRole: "User", ),
                SizedBox(height: mediaQuerySize.height * 0.02.h),

                AllMembersWidget(name: "Harry", initialRole: "User", ),
                SizedBox(height: mediaQuerySize.height * 0.02.h),

                AllMembersWidget(name: "Porter", initialRole: "Manager", ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
