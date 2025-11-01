import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_btn.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class NoteMoelSheet extends StatelessWidget {
  const NoteMoelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'Add Note',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          CustomTextField(hintText: 'Note '),
          SizedBox(height: 16),
          CustomTextField(hintText: 'Description', maxLines: 5),
          SizedBox(height: 16),
          CustomBtn(
            text: 'Add',
            onTap: () {
              // Action to save the note
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
