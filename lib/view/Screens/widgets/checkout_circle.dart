import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CheckoutCircle extends StatelessWidget {
  final String text;
  final int index;
  final int selectedIndex;
  final Function(int) onSelect;

  CheckoutCircle({
    super.key,
    required this.text,
    required this.index,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    
    bool isSelected = index == selectedIndex;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mediaQuerySize.width * 0.02.w,
        vertical: mediaQuerySize.height * 0.01.h,
      ),
      child: GestureDetector(
        onTap: () {
          onSelect(index); // Update selected index on tap
        },
        child: Row(
          children: [
            Container(
              height: mediaQuerySize.height * 0.025.h,
              width: mediaQuerySize.width * 0.05.w,
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Icon(
                        Icons.check,
                        size: 15,
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
            SizedBox(width: mediaQuerySize.width * 0.02.w),
            Text(
              text,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
