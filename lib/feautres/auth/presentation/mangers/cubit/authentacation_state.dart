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

final class GoogleSignInLoading extends AuthentacationState {}

final class GoogleSignInSuccess extends AuthentacationState {}

final class GoogleSignInFailure extends AuthentacationState {}

final class LogOutLoading extends AuthentacationState {}

final class LogOutSuccess extends AuthentacationState {}

final class LogOutFailure extends AuthentacationState {}

final class ResetPasswordLoading extends AuthentacationState {}

final class ResetPasswordSuccess extends AuthentacationState {}

final class ResetPasswordFailure extends AuthentacationState {}

final class AddUserDataLoading extends AuthentacationState {}

final class AddUserDataSuccess extends AuthentacationState {}

final class AddUserDataFailure extends AuthentacationState {}

final class GetUserDataLoading extends AuthentacationState {}

final class GetUserDataSuccess extends AuthentacationState {}

final class GetUserDataFailure extends AuthentacationState {}
