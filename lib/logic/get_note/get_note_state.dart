part of 'get_note_cubit.dart';

@immutable
abstract class GetNoteState {}

class GetNoteInitial extends GetNoteState {}

class GetNoteSuc extends GetNoteInitial {
  final List<NoteModel> notes;
  GetNoteSuc({required this.notes});
}

class GetNoteError extends GetNoteInitial {
  final String message;
  GetNoteError(this.message);
}

class Loading extends GetNoteInitial {}
