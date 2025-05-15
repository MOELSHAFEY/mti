import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../data/data_model.dart';

part 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitial());
  Future<void> getNote() async {
    emit(Loading());
    try {
      final date = await FirebaseFirestore.instance.collection("notes").get();
      final notes = date.docs.map((e) => NoteModel.fromJson(e.data())).toList();
      emit(GetNoteSuc(notes: notes));
    } catch (e) {
      emit(GetNoteError(e.toString()));
    }
  }
}
