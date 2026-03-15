import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_note_app/cubit/add_note_cubit.dart';
import 'package:hive_note_app/cubit/simple_bloc_observer.dart';
import 'package:hive_note_app/models/note_item_model.dart';
import 'package:hive_note_app/views/note_app_home_view.dart';
import 'package:hive_note_app/views/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteItemModelAdapter());
  await Hive.openBox<NoteItemModel>(Constants.kNoteBox);
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: NoteAppHomeView(),
      ),
    );
  }
}
