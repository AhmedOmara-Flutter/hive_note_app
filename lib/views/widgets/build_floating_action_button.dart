import 'package:flutter/material.dart';
import 'build_modal_bottom_sheet.dart';

class BuildFloatingActionButton extends StatelessWidget {
  const BuildFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (context) => BuildModalBottomSheet(),
        );
      },
      shape: CircleBorder(),
      backgroundColor: Colors.grey.shade800,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
