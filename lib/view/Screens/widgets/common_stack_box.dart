import 'package:flutter/material.dart';

class CommonStackBox extends StatelessWidget {
  final String? text;
  final double width;

  CommonStackBox({super.key, this.text,this.width=300});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      height: mediaQuerySize.height * 0.04,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 0,
            offset: Offset(0, 1),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text ?? '',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
