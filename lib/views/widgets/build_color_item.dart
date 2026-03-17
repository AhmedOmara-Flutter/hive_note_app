import 'package:flutter/material.dart';

class BuildColorItem extends StatelessWidget {
  final bool isActive;
  final Color color;


  const BuildColorItem({super.key, required this.isActive, required this.color});

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: CircleAvatar(radius: 24, backgroundColor: color),
          )
        : CircleAvatar(radius: 28, backgroundColor:color);
  }
}
