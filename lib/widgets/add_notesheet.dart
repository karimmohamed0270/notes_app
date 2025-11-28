import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/add_note_cubit/cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/widgets/add_note_form_forsheet.dart';
import 'package:notes_app/widgets/custom_btn.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class NoteMoelSheet extends StatelessWidget {
  const NoteMoelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    //  step 5 use the cubit consumer to listen to the states of the cubit (integrate cubit)
    //blocconsumer == blockbuilder + blocklistener
    return BlocConsumer<AddNoteCubitCubit, AddNoteCubitState>(
      listener: (context, state) {
        if (state is AddNoteCubitSuccess) {
          Navigator.pop(context);
        }
        if (state is AddNoteCubitFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          //  to prevent user from interacting with the form when loading
          //  if the state is loading the absorbing will be true else false
          absorbing: state is AddNoteCubitLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
              // to make the bottom sheet go up when the keyboard appears
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: AddNoteForm(),
          ),
        );
      },
    );
  }
}
