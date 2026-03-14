import 'package:flutter/material.dart';
import 'package:hive_note_app/views/note_app_home_view.dart';

void main() {
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
