import 'package:flutter/material.dart';
import 'package:hive_note_app/views/custom_appbar.dart';

class NoteAppHomeView extends StatelessWidget {
  const NoteAppHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            CustomAppbar()
        
          ],
        ),
      ),
    );
  }
}
