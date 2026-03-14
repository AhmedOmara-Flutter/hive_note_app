import 'package:flutter/material.dart';
import 'package:hive_note_app/views/widgets/custom_text_form_field.dart';

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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(hintText: 'Title',),
            SizedBox(height: 20,),
            CustomTextFormField(hintText: 'Content', maxLines: 6,),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Add',
                  style: TextStyle(fontSize: 18, color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
