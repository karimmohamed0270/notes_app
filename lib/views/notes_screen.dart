import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/add_note_cubit/cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/add_note_cubit/cubit/create_notes_cubit/cubit/createaddcubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/notes_item_container.dart';
import 'package:notes_app/widgets/add_notesheet.dart';

class NotesScreen extends StatelessWidget {
  static const String id = 'notes_screen';

  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const Text('Notes'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Action to add a new note
              },
            ),
          ),
        ],
      ),
      body: NotesListView(),
      //  floating action button to add a new note (+)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) =>
                //  the poput page what will show to add the note (notesModelSheet is an custom widget)
                NoteMoelSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
    return scaffold;
  }
}

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateaddcubitCubit, CreateaddcubitState>(
      builder: (context, state) {
        if (state is CreateNoteCubitLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CreateNoteCubitSuccess) {
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              final note = state.notes[index];

              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    EditNoteView.id,
                    arguments: note,
                  );
                },
                child: NotesItem(note: note),
              );
            },
          );
        }

        if (state is CreateNoteCubitFailure) {
          return Center(
            child: Text(
              "Error: ${state.errorMessage}",
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        return const Center(
          child: Text("No notes yet", style: TextStyle(fontSize: 20)),
        );
      },
    );
  }
}
