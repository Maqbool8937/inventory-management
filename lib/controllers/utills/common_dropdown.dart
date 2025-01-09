import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownInCard extends StatefulWidget {
  final List<String> items;
  final String hintText;
  String? selected;
  Function onChange;
  IconData? icon;

  DropdownInCard(
      {Key? key,
      required this.selected,
      required this.items,
      required this.hintText,
      required this.onChange,
      this.icon})
      : super(key: key);

  @override
  _DropdownInCardState createState() => _DropdownInCardState();
}

class _DropdownInCardState extends State<DropdownInCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: false,
                    hint: Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    items: widget.items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Row(
                                children: [
                                  Icon(Icons.home_outlined),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                    value: widget.selected,
                    onChanged: (String? value) {
                      setState(() {
                        widget.selected = value;
                      });
                      widget.onChange(value);
                    },
                    buttonStyleData: ButtonStyleData(
                      // height: 50,
                      // width: 160,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(
                        //   color: Colors.black26,
                        // ),
                        color: const Color.fromARGB(255, 234, 235, 236),
                      ),
                      elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                      iconSize: 22,
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.black,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      // maxHeight: 200,
                      // width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
