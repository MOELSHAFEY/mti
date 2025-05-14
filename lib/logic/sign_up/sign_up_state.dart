part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SuccessSignup extends SignUpState {}

class ErrorSignup extends SignUpState {
  final String message;
  ErrorSignup(this.message);
}

class Loading extends SignUpState {}
