import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/add_note_cubit/cubit/create_notes_cubit/cubit/createaddcubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(16),
        ),
        // height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  note.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                subtitle: Text(
                  note.content,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.black, size: 36),
                  onPressed: () {
                    // Action to delete the note
                    // hive delete method
                    note.delete();
                    // refresh the UI
                    BlocProvider.of<CreateaddcubitCubit>(context).fetchnote();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(note.date, style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
