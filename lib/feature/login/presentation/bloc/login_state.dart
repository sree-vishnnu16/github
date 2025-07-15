import 'package:github/feature/login/domain/entities/login.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginEntity user;

  LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}

// logout
class LogoutLoading extends LoginState {}

class LogoutSuccess extends LoginState {
  final bool status;

  LogoutSuccess(this.status);
}

class LogoutFailure extends LoginState {
  final String message;

  LogoutFailure(this.message);
}
