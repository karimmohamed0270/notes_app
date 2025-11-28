part of 'createaddcubit_cubit.dart';

@immutable
sealed class CreateaddcubitState {}

class CreateNoteCubitInitial extends CreateaddcubitState {}

class CreateNoteCubitLoading extends CreateaddcubitState {}

class CreateNoteCubitSuccess extends CreateaddcubitState {
  //  to show notes after adding a new note in the screen
  final List<NoteModel> notes;
  CreateNoteCubitSuccess(this.notes);
}

class CreateNoteCubitFailure extends CreateaddcubitState {
  final String errorMessage;
  CreateNoteCubitFailure(this.errorMessage);
}
