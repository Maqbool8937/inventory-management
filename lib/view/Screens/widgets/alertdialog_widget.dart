import 'package:flutter/material.dart';

import '../../../controllers/utils/app_colors.dart';

class AlertdialogWidget extends StatelessWidget {
  const AlertdialogWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton.small(
        onPressed: () {
          _showPopupMenu(context);
        },
        backgroundColor: AppColors.buttonColor,
        shape: CircleBorder(), // Ensures a circular shape
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      );
    
  }

  void _showPopupMenu(BuildContext context) {  

    showDialog(
  context: context,
  builder: (BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(
          left: mediaQuerySize.width * 0.5, // Responsive left padding
          top: mediaQuerySize.height * 0.5, // Responsive top padding
        ),
        child: AlertDialog(
          backgroundColor: Colors.transparent, // Removed background color
          alignment: Alignment.centerRight,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             
             // SizedBox(height: mediaQuerySize.height * 0.02), // Responsive spacing
              Padding(
                padding: EdgeInsets.only(
                  left: mediaQuerySize.width * 0.02,
                  top: mediaQuerySize.height * 0.01,
                ),
                child: Container(
                  width: mediaQuerySize.width * 0.15, // Circular size
                  height: mediaQuerySize.width * 0.15, // Circular size
                  decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    shape: BoxShape.circle, // Circular shape
                  ),
                  child: Center(
                    child: Icon(
                      Icons.share,
                      size: mediaQuerySize.width * 0.09, // Icon fills the space
                      color: Colors.white,
                    ),
                  ),
                ),
                
              ),
      Padding(
  padding: EdgeInsets.only(
    left: mediaQuerySize.width * 0.02,
    top: mediaQuerySize.height * 0.01,
  ),
  child: GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: Stack(
              children: [
             
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text(
                        "Mark Note",
                        style: TextStyle(
                          fontSize: mediaQuerySize.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                       ),
                           
                        Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                        ),
                      ],
                    ),
                   
                    SizedBox(height: mediaQuerySize.height * 0.02),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add your upload image logic here
                      },
                      icon: Icon(Icons.upload),
                      label: Text("Upload Image"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                    SizedBox(height: mediaQuerySize.height * 0.02),
                    Container(
                      height: mediaQuerySize.height * 0.1, // Reduced height
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Mark Note",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        maxLines: 2, // Reduced max lines
                      ),
                    ),
                    SizedBox(height: mediaQuerySize.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Add your delete logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          child: Text("Delete",style: TextStyle(color: Colors.red),),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add your take note logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text("Take Note",style: TextStyle(color: Colors.white
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
    child: Container(
      width: mediaQuerySize.width * 0.15, // Circular size
      height: mediaQuerySize.width * 0.15, // Circular size
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        shape: BoxShape.circle, // Circular shape
      ),
      child: Center(
        child: Icon(
          Icons.note_add,
          size: mediaQuerySize.width * 0.09, // Icon fills the space
          color: Colors.white,
        ),
      ),
    ),
  ),
),

            ],
          ),
        ),
      ),
    );
  },
);
  }
}

