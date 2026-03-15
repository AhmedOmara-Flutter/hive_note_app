import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_note_app/models/note_item_model.dart';
import 'package:hive_note_app/views/widgets/constants.dart';
import 'package:meta/meta.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  static AddNoteCubit get(context) => BlocProvider.of<AddNoteCubit>(context);

  List<NoteItemModel> notes = [

  ];


  void addNote(NoteItemModel note) async{
    emit(AddNoteLoading());
    try {
      var box = Hive.box<NoteItemModel>(Constants.kNoteBox);
      await box.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      print(e);
      emit(AddNoteFailure(e.toString()));
    }
  }


  void getNote(){
    var box = Hive.box<NoteItemModel>(Constants.kNoteBox);
    notes = box.values.toList();
    emit(AddNoteSuccess());

  }
}
