import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final AutovalidateMode? autoValidateMode;


  const CustomTextFormField(
      {super.key, this.hintText, this.maxLines = 1, this.onSaved, this.autoValidateMode});

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
      onSaved: onSaved,
      autovalidateMode: autoValidateMode,
      cursorColor:  Colors.blue,
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
          borderSide: BorderSide(color:  Colors.blue, width: 1),
        ),
      ),
    );
  }
}
