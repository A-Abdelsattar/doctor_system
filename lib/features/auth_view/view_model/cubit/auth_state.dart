part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class ChangeLoginStatus extends AuthState {}

class RegisterLoadingState extends AuthState {}
class RegisterErrorState extends AuthState {
  final String error;
  RegisterErrorState(this.error);
}
class RegisterSuccessState extends AuthState {
  final String message;

  RegisterSuccessState(this.message);
}

