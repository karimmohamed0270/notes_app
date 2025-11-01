import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_item.dart';

class NotesScreen extends StatelessWidget {
  static const String id = 'notes_screen';
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
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
