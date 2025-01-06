import 'package:flutter/material.dart';
import 'package:inventory_management_app/controllers/utils/app_colors.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.013, vertical: mediaQuerySize.height * 0.0055),
          decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(5)),
          child: const Icon(
            Icons.menu,
            color: AppColors.whiteColor,
          ),
        ),
        const Expanded(
            child: Center(
                child: Text(
          'Messoge',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ))),
        Container(
          padding: EdgeInsets.symmetric(horizontal: mediaQuerySize.width * 0.013, vertical: mediaQuerySize.height * 0.0055),
          decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(5)),
          child: const Icon(
            Icons.person,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
