import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_screen.dart';

void main() async {
  //  intit hive
  await Hive.initFlutter();
  //  open a box called notes_app to (store) data related to our app
  await Hive.openBox('notes_app');
  //  register adpateor to treat with NoteModel type and (connect) it with hive database
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: const NotesScreen(),
      routes: {
        NotesScreen.id: (context) => const NotesScreen(),
        EditNoteView.id: (context) => const EditNoteView(),
      },
    );
  }
}
