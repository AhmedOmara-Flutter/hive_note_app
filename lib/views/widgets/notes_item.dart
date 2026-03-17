import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_note_app/views/utils/utils.dart';
import 'package:hive_note_app/views/widgets/edit_notes_app_view.dart';

import '../../cubit/get_note_cubit.dart';
import '../../models/note_item_model.dart';
import '../utils/constants.dart';

class NotesItem extends StatelessWidget {
  const NotesItem(
      {super.key, required this.noteItemModel, required this.index});

  final int index;
  final NoteItemModel noteItemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditNotesAppView(noteItemModel:noteItemModel,index: index,)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF4C978),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    noteItemModel.title ,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Hive.box<NoteItemModel>(Constants.kNoteBox).deleteAt(index);
                    BlocProvider.of<GetNoteCubit>(context).getNote();
                  },
                  icon: const Icon(Icons.delete, color: Colors.black, size: 28),
                  padding: EdgeInsets.all(10),
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child:  Text(
                noteItemModel.subTitle,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF9E7B4D),
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 24),
             Align(
              alignment: Alignment.bottomRight,
              child: Text(
                Utils.formateDate(noteItemModel.date),
                style: TextStyle(fontSize: 16, color: Color(0xFF9E7B4D)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
