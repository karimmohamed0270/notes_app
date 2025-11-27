import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/add_note_cubit/cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_screen.dart';
import 'package:notes_app/views/simple_bserver_cubit.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  //  intit hive
  await Hive.initFlutter();
  //  register adpateor to treat with NoteModel type and (connect) it with hive database
  Hive.registerAdapter(NoteModelAdapter());
  //  open a box called notes_app to (store) data related to our app
  await Hive.openBox<NoteModel>('notes_app');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //  step 4 provide the cubit to the app
      providers: [BlocProvider(create: (context) => AddNoteCubitCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: const NotesScreen(),
        routes: {
          NotesScreen.id: (context) => const NotesScreen(),
          EditNoteView.id: (context) => const EditNoteView(),
        },
      ),
    );
  }
}
