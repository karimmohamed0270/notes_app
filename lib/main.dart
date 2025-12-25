import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/add_note_cubit/cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/add_note_cubit/cubit/create_notes_cubit/cubit/createaddcubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_screen.dart';
import 'package:notes_app/views/simple_bserver_cubit.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes_app');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AddNoteCubitCubit()),
        BlocProvider(create: (_) => CreateaddcubitCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: const NotesScreen(),
        routes: {
          NotesScreen.id: (context) => const NotesScreen(),

          EditNoteView.id: (context) {
            final note =
                ModalRoute.of(context)!.settings.arguments as NoteModel;
            return EditNoteView(note: note);
          },
        },
      ),
    );
  }
}
