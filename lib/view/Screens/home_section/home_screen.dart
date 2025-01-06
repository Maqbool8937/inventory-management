import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize= MediaQuery.of(context).size;
    return Scaffold(body: SafeArea(child: Container()),);
  }
}