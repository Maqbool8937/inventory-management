import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management_app/view/Screens/widgets/common_appbar.dart';

class RoadSideServices extends StatelessWidget {
  RoadSideServices({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppBar.commonAppBar(context, scaffoldKey),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.03.w, vertical: mediaQuerySize.height * 0.01.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuerySize.height * 0.035.h,
                ),
                Text(
                  'Roadside Services',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: mediaQuerySize.height * 0.02,
                ),
                Wrap(
                    children: List.generate(
                  5,
                  (index) => Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.02, vertical: mediaQuerySize.height * 0.01),
                      child: SizedBox(
                        height: mediaQuerySize.height * 0.13,
                        width: mediaQuerySize.width * 0.25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/battery_icon.png'),
                            Text(
                              maxLines: 2,
                              'Flat Tyre',
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
