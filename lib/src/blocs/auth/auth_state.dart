part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String email;
  final String password;
  final String confirmPass;
  final List<int> changePassCode;
  final String message;

// ChangePassCode Model
  static const List<int> defaultChangePassCode = [0, 0, 0, 0, 0, 0];

  const AuthState({
    this.email = '',
    this.password = '',
    this.confirmPass = '',
    this.changePassCode = defaultChangePassCode,
    this.message = '',
  });

  AuthState copyWith({
    String? email,
    String? password,
    String? confirmPass,
    List<int>? changePassCode,
    String? message,
  }) {
    print("Mensaje: $message");
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPass: confirmPass ?? this.confirmPass,
      changePassCode: changePassCode ?? this.changePassCode,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [email, password, confirmPass, changePassCode, message];
}
