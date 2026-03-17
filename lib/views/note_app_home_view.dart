import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_note_app/cubit/get_note_cubit.dart';
import 'package:hive_note_app/views/widgets/build_floating_action_button.dart';
import 'package:hive_note_app/views/widgets/note_home_view_body.dart';

class NoteAppHomeView extends StatelessWidget {
  const NoteAppHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNoteCubit, GetNoteState>(
      builder: (context, state) {
        var item = GetNoteCubit
            .get(context)
            .notes;
        return Scaffold(
          floatingActionButton: BuildFloatingActionButton(),
          body: ConditionalBuilder(
            condition: item.isNotEmpty,
            builder: (context) => NoteHomeViewBody(item: item),
            fallback: (context) =>
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                          'images/empty-folder.png', height: 150),

                ),
                    Center(
                      child: Text(
                          'No Notes',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          )
                      ),)
              ],
            ),
          ),
        );
      },
    );
  }
}

