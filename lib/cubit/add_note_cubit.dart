import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_note_app/models/note_item_model.dart';
import 'package:hive_note_app/views/widgets/constants.dart';
import 'package:meta/meta.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  void addNote(NoteItemModel note) {
    emit(AddNoteLoading());
    try {
      var box = Hive.box<NoteItemModel>(Constants.kNoteBox);
      box.add(note);
      print(box);
      emit(AddNoteSuccess());
    } catch (e) {
      print(e);
      emit(AddNoteFailure(e.toString()));
    }
  }
}
