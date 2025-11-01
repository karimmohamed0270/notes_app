import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_item_container.dart';
import 'package:notes_app/widgets/notesmodelsheet.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) =>
                //  the poput page what will show to add the note
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
    return ListView.builder(
      itemBuilder: (context, index) {
        return NotesItem();
      },
    );
  }
}
