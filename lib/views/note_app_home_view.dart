import 'package:flutter/material.dart';
import 'package:hive_note_app/views/widgets/build_floating_action_button.dart';
import 'package:hive_note_app/views/widgets/custom_appbar.dart';
import 'package:hive_note_app/views/widgets/notes_item.dart';
import '../models/note_item_model.dart';

class NoteAppHomeView extends StatelessWidget {
  const NoteAppHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BuildFloatingActionButton(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomAppbar(label: 'Notes', icon: Icons.search,),
              )),
          SliverList.separated(
            itemBuilder: (context, index) =>
                NotesItem(noteItemModel: NoteItemModel(title: 'title',
                    subTitle: 'subTitle',
                    color: 1,
                    date: 'date'),),
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}


