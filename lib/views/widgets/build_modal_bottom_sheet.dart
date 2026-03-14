import 'package:flutter/material.dart';
import 'package:hive_note_app/views/widgets/add_note_form.dart';

class BuildModalBottomSheet extends StatelessWidget {
  const BuildModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40,horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xff383838),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: AddNoteForm(),
    );
  }
}
