import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management_app/view/Screens/home_section/home_screen.dart';
import 'package:inventory_management_app/view/Screens/settings_section/settings1_screen.dart';
import 'package:inventory_management_app/view/Screens/transfer_section/transfer_screen.dart';

// ignore: must_be_immutable
class BottomNavigationBarScreen extends StatelessWidget {
  BottomNavigationBarScreen({super.key});

  RxInt selectedIndex = 0.obs;

  List<Widget> screen = [HomeScreen(), TransferScreenOne(), SettingsOneScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return screen[selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            currentIndex: selectedIndex.value,
            onTap: (value) {
              selectedIndex.value = value;
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.transfer_within_a_station), label: 'Transfer'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
            ]);
      }),
    );
  }
}
