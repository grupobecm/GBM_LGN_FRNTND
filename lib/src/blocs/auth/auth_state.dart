part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String email;
  final String password;
  final String confirmPass;
  final int resetCode1;
  final int resetCode2;
  final int resetCode3;
  final int resetCode4;
  final int resetCode5;
  final int resetCode6;

  const AuthState({
    this.email = '',
    this.password = '',
    this.confirmPass = '',
    this.resetCode1 = 0,
    this.resetCode2 = 0,
    this.resetCode3 = 0,
    this.resetCode4 = 0,
    this.resetCode5 = 0,
    this.resetCode6 = 0,
  });

  AuthState copyWith({
    String? email,
    String? password,
    String? confirmPass,
    int? resetCode1,
    int? resetCode2,
    int? resetCode3,
    int? resetCode4,
    int? resetCode5,
    int? resetCode6,
  }) =>
      AuthState(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPass: confirmPass ?? this.confirmPass,
        resetCode1: resetCode1 ?? this.resetCode1,
        resetCode2: resetCode2 ?? this.resetCode2,
        resetCode3: resetCode3 ?? this.resetCode3,
        resetCode4: resetCode4 ?? this.resetCode4,
        resetCode5: resetCode5 ?? this.resetCode5,
        resetCode6: resetCode6 ?? this.resetCode6,
      );

  @override
  List<Object> get props => [email];
}
