import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('notes_app');
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
