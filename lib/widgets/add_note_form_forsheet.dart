import 'package:flutter/widgets.dart';
import 'package:notes_app/widgets/custom_btn.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

//  consts
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

String? title;
String? content;

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Text(
                'Add Note',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            CustomTextField(
              hintText: 'Note ',
              onSaved: (value) {
                title = value;
              },
            ),
            SizedBox(height: 16),
            CustomTextField(
              hintText: 'Description',
              maxLines: 5,
              onSaved: (value) {
                content = value;
              },
            ),
            SizedBox(height: 16),
            CustomBtn(
              text: 'Add',
              onTap: () {
                // Action to save the note
                //  validate the form
                if (formKey.currentState != null &&
                    formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
