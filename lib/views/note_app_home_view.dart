import 'package:flutter/material.dart';
import 'package:hive_note_app/views/custom_appbar.dart';
import 'package:hive_note_app/views/notes_item.dart';

class NoteAppHomeView extends StatelessWidget {
  const NoteAppHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomAppbar()),
          SliverList.separated(
            itemBuilder: (context, index) => NotesItem(),
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
