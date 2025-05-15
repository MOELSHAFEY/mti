import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> submitForm(String email, String password) async {
    emit(Loading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SuccessSignup());
    } catch (e) {
      emit(ErrorSignup(e.toString()));
    }
  }
}
