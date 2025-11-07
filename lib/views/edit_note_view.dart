import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  static String id = 'edit_note_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                // Action to save the edited note
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CustomTextField(hintText: "Title"),
          SizedBox(height: 20),
          CustomTextField(hintText: "content", maxLines: 8),
        ],
      ),
    );
  }
}
