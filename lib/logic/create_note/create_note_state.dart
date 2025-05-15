part of 'create_note_cubit.dart';

@immutable
abstract class CreateNoteState {}

class CreateNoteinit extends CreateNoteState {}

class CreateNoteSuc extends CreateNoteState {}

class CreateNoteError extends CreateNoteState {
  final String message;
  CreateNoteError(this.message);
}

class Loading extends CreateNoteState {}
