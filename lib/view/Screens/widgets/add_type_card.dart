import 'package:flutter/material.dart';



// ignore: must_be_immutable
class AddTypeCard extends StatefulWidget {
  final List<String> items;
  final String hintText;
  String? selectedItem;
  Function? onChange;
  AddTypeCard({Key? key, required this.items, required this.hintText, required this.selectedItem, this.onChange}) : super(key: key);

  @override
  _AddTypeCardState createState() => _AddTypeCardState();
}

class _AddTypeCardState extends State<AddTypeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.hintText,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
           
          ],
        ),
      ),
    );
  }
}
