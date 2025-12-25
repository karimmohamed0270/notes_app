import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'createaddcubit_state.dart';

class CreateaddcubitCubit extends Cubit<CreateaddcubitState> {
  CreateaddcubitCubit() : super(CreateNoteCubitInitial());
  // ,,,,,,,,,,,,,,,,,
  List<NoteModel>? notes;
  fetchnote() {
    emit(CreateNoteCubitLoading());
    try {
      var notesBox = Hive.box<NoteModel>('notes_app');
      notes = notesBox.values.toList();
      emit(CreateNoteCubitSuccess(notes!));
    } catch (e) {
      emit(CreateNoteCubitFailure(e.toString()));
    }
  }
}
