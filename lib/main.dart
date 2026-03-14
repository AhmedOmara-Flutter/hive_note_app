import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_note_app/models/note_item_model.dart';
import 'package:hive_note_app/views/note_app_home_view.dart';
import 'package:hive_note_app/views/widgets/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteItemModelAdapter());
  await Hive.openBox<NoteItemModel>(Constants.kNoteBox);
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: NoteAppHomeView(),
    );
  }
}
