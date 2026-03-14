import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final int maxLines;

  const CustomTextFormField({super.key, this.hintText, this.maxLines=1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor:  Color(0xFF9E7B4D),
      style: TextStyle(color: Colors.white),
      maxLines: maxLines,
      decoration: InputDecoration(

        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:  Color(0xFF9E7B4D), width: 1),
        ),
      ),
    );
  }
}
