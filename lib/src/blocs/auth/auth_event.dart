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
  final int resetCode1;
  final int resetCode2;
  final int resetCode3;
  final int resetCode4;
  final int resetCode5;
  final int resetCode6;

  const GetPassCode(
    this.resetCode1,
    this.resetCode2,
    this.resetCode3,
    this.resetCode4,
    this.resetCode5,
    this.resetCode6,
  );
}
