part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SuccessSignin extends SignInState {}

class ErrorSignin extends SignInState {
  final String message;
  ErrorSignin(this.message);
}

class Loading extends SignInState {}
