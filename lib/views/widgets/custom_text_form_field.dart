import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final Color color;
  final void Function(String)? onChange;




  const CustomTextFormField(
      {super.key, this.hintText, this.maxLines = 1, this.onSaved, this.controller, this.color=Colors.white, this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }
        else {
          return null;
        }
      },
      onChanged: onChange,
      onSaved: onSaved,
      controller: controller,
      cursorColor:  Colors.blue,
      style: TextStyle(color: color),
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: color),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:  Colors.blue, width: 1),
        ),
      ),
    );
  }
}
