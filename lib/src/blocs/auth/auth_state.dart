part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String email;
  final String password;
  final String confirmPass;
  final List<int> changePassCode;

// ChangePassCode Model
  static const List<int> defaultChangePassCode = [0, 0, 0, 0, 0, 0];

  const AuthState({
    this.email = '',
    this.password = '',
    this.confirmPass = '',
    this.changePassCode = defaultChangePassCode,
  });

  AuthState copyWith({
    String? email,
    String? password,
    String? confirmPass,
    List<int>? changePassCode,
  }) =>
      AuthState(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPass: confirmPass ?? this.confirmPass,
        changePassCode: changePassCode ?? this.changePassCode,
      );

  @override
  List<Object> get props => [email, password, confirmPass, changePassCode];
}
