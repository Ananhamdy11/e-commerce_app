part of 'authentacation_cubit.dart';

sealed class AuthentacationState {}

final class AuthentacationInitial extends AuthentacationState {}

final class LoginLoading extends AuthentacationState {}
final class LoginSuccess extends AuthentacationState {}
final class LoginFailure extends AuthentacationState {
  final String message;

  LoginFailure(this.message);
}

final class SignUpLoading extends AuthentacationState {}
final class SignUpSuccess extends AuthentacationState {}
final class SignUpFailure extends AuthentacationState {
  final String message;

  SignUpFailure(this.message);
}
