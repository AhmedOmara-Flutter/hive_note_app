import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text('Notes',style:TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          Spacer(),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle
            ),
            child:Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
