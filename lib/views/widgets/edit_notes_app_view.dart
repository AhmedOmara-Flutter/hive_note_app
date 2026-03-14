import 'package:flutter/material.dart';
import 'package:hive_note_app/views/widgets/custom_appbar.dart';
import 'package:hive_note_app/views/widgets/custom_text_form_field.dart';

class EditNotesAppView extends StatelessWidget {
  const EditNotesAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomAppbar(label: 'Edit Note', icon: Icons.done,),
            SizedBox(height: 20,),
            CustomTextFormField(hintText: 'Title',),
            SizedBox(height: 20,),
            CustomTextFormField(hintText: 'Content', maxLines: 6,),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
