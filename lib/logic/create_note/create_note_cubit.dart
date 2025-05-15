import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:mti/data/data_model.dart';

part 'create_note_state.dart';

class CreateNoteCubit extends Cubit<CreateNoteState> {
  CreateNoteCubit() : super(CreateNoteinit());

  Future<void> add(NoteModel x) async {
        emit(Loading());
    try {
      await FirebaseFirestore.instance.collection("notes").add(x.toJson());
      emit(CreateNoteSuc());
    } catch (e) {
      emit(CreateNoteError(e.toString()));
    }
  }
}
