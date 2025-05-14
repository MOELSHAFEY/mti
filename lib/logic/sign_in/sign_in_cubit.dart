import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  Future<void> submitForm(String email, String password) async {
    emit(Loading());
    // Simulate API call
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SuccessSignin());
    } catch (e) {
      emit(ErrorSignin(e.toString()));
    }
  }
}
