import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_note_app/cubit/add_note_cubit.dart';
import 'package:hive_note_app/models/note_item_model.dart';
import 'package:hive_note_app/views/widgets/build_color_list.dart';
import 'package:hive_note_app/views/widgets/custom_button.dart';
import 'package:hive_note_app/views/widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              hintText: 'Title',
              controller: _titleController,
              onSaved: (value) {
                title = value;
              },
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              hintText: 'Content',
              controller: _contentController,
              maxLines: 6,
              onSaved: (value) {
                content = value;
              },
            ),
            SizedBox(height: 15),
           BuildColorList(),
            SizedBox(height: 15),

            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AddNoteCubit.get(context).addNote(
                          NoteItemModel(title: title.toString(),
                              subTitle: content.toString(),
                              color: 1,
                              date: DateTime.now().toString()));
                      _contentController.clear();
                      _titleController.clear();
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  }, isLoading: state is AddNoteLoading ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

}
