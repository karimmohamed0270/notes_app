import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  static const String id = 'edit_note_view';

  final NoteModel note;

  const EditNoteView({super.key, required this.note});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title;
  String? content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;

              await widget.note.save();

              Navigator.pop(context); // go back
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CustomTextField(
            hintText: widget.note.title,
            onChanged: (value) => title = value,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hintText: widget.note.content,
            maxLines: 8,
            onChanged: (value) => content = value,
          ),
        ],
      ),
    );
  }
}
