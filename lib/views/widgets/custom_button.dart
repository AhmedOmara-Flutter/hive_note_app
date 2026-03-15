import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isLoading;
  const CustomButton({super.key, this.onPressed, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child:isLoading?CircularProgressIndicator(color: Colors.white,): Text(
        'Add',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
