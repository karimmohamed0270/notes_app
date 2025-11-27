import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/add_note_cubit/cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
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
int color = Colors.amber.value;

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
            //  i use blocbuilder to rebuild only the button when the state changes not the whole form
            //  to know the states of the cubit
            BlocBuilder<AddNoteCubitCubit, AddNoteCubitState>(
              builder: (context, state) {
                return CustomBtn(
                  //  if state is loading show loading indicator will apper in the btn else show add text
                  isLoading: state is AddNoteCubitLoading ? true : false,
                  text: 'Add',
                  onTap: () {
                    // Action to save the note
                    //  validate the form
                    if (formKey.currentState != null &&
                        formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      //  step 6 triger cubit

                      //  first save data to model to use it in triger cubit in add note fun
                      var notemodel = NoteModel(
                        title: title!,
                        content: content!,
                        date: DateTime.now().toString(),
                        color: color,
                      );
                      BlocProvider.of<AddNoteCubitCubit>(
                        context,
                      ).addnote(notemodel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
