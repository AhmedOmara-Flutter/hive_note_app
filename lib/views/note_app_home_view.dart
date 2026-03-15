import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_note_app/cubit/get_note_cubit.dart';
import 'package:hive_note_app/views/widgets/build_floating_action_button.dart';
import 'package:hive_note_app/views/widgets/custom_appbar.dart';
import 'package:hive_note_app/views/widgets/notes_item.dart';
import '../models/note_item_model.dart';

class NoteAppHomeView extends StatelessWidget {
  const NoteAppHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNoteCubit()..getNote(),
      child: BlocBuilder<GetNoteCubit, GetNoteState>(
        builder: (context, state) {
          var item=GetNoteCubit.get(context).notes;
          return Scaffold(
            floatingActionButton: BuildFloatingActionButton(),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomAppbar(label: 'Notes', icon: Icons.search,),
                    )),
                SliverList.builder(
                  itemBuilder: (context, index) =>
                      NotesItem(noteItemModel: NoteItemModel(title:item[index].title ,
                          subTitle: item[index].subTitle,
                          color: item[index].color,
                          date: item[index].date),),
                  itemCount: GetNoteCubit.get(context).notes.length,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


