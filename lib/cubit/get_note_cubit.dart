import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../models/note_item_model.dart';
import '../views/utils/constants.dart';
part 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitial());

  static GetNoteCubit get(context) => BlocProvider.of(context);
  List<NoteItemModel> notes = [];

  void getNote() {
    var box = Hive.box<NoteItemModel>(Constants.kNoteBox);
    notes = box.values.toList();
    emit(GetNoteSuccess());
  }
}
