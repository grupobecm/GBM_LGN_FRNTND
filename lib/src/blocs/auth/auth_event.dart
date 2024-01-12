part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class LogIn extends AuthEvent {
  final String? email;
  final String? password;

  const LogIn(this.email, this.password);
}

final class GetPassCode extends AuthEvent {
  final List<int> changePassCode;

  const GetPassCode(this.changePassCode);
}
