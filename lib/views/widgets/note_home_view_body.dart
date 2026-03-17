import 'package:flutter/material.dart';
import 'package:hive_note_app/models/note_item_model.dart';

import '../../cubit/get_note_cubit.dart';
import 'custom_appbar.dart';
import 'notes_item.dart';

class NoteHomeViewBody extends StatelessWidget {
  const NoteHomeViewBody({super.key, required this.item});

  final List<NoteItemModel> item;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomAppbar(label: 'Notes', icon: Icons.search),
          ),
        ),
        SliverList.builder(
          itemBuilder: (context, index) => NotesItem(
            noteItemModel: NoteItemModel(
              title: item[index].title,
              subTitle: item[index].subTitle,
              color: item[index].color,
              date: item[index].date,
            ),
            index: index,
          ),
          itemCount: GetNoteCubit.get(context).notes.length,
        ),
      ],
    );
  }
}
