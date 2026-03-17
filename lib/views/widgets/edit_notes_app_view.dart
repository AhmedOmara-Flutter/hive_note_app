import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_note_app/models/note_item_model.dart';
import 'package:hive_note_app/views/widgets/custom_appbar.dart';
import 'package:hive_note_app/views/widgets/custom_text_form_field.dart';

import '../../cubit/get_note_cubit.dart';
import '../utils/constants.dart';

class EditNotesAppView extends StatefulWidget {
  final NoteItemModel noteItemModel;
  final int index;

  const EditNotesAppView(
      {super.key, required this.noteItemModel, required this.index});

  @override
  State<EditNotesAppView> createState() => _EditNotesAppViewState();
}

class _EditNotesAppViewState extends State<EditNotesAppView> {
  String ?title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomAppbar(label: 'Edit Note', icon: Icons.done, onTap: () async {
               widget.noteItemModel.title=title ?? widget.noteItemModel.title;
               widget.noteItemModel.subTitle=content ?? widget.noteItemModel.subTitle;
              await Hive.box<NoteItemModel>(Constants.kNoteBox).putAt(
                  widget.index,
                  NoteItemModel(
                      title: widget.noteItemModel.title,
                      subTitle: widget.noteItemModel.subTitle,
                      color:widget.noteItemModel.color,
                      date:widget.noteItemModel.date
                  )
              );
              BlocProvider.of<GetNoteCubit>(context).getNote();
              Navigator.pop(context);
            },),
            SizedBox(height: 20,),
            CustomTextFormField(
              hintText: widget.noteItemModel.title, color: Colors.black,
              onChange: (value) {
                title = value;
              },
            ),
            SizedBox(height: 20,),
            CustomTextFormField(
              hintText: widget.noteItemModel.subTitle,
              maxLines: 6,
              color: Colors.black,
              onChange: (value) {
                content = value;
              },
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
