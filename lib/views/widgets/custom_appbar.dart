import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String label;
  final IconData icon;

  const CustomAppbar({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
          top: 50,bottom: 20),
      child: Row(
        children: [
          Text(label,style:TextStyle(
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
            child:Icon(icon),
          )
        ],
      ),
    );
  }
}
