part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String email;
  final String password;
  final String confirmPass;
  final List<int> changePassCode;
  final String code;
  final bool isLoading;

// ChangePassCode Model
  static const List<int> defaultChangePassCode = [0, 0, 0, 0, 0, 0];

  const AuthState({
    this.email = '',
    this.password = '',
    this.confirmPass = '',
    this.changePassCode = defaultChangePassCode,
    this.code = '',
    this.isLoading = false,
  });

  AuthState copyWith({
    String? email,
    String? password,
    String? confirmPass,
    List<int>? changePassCode,
    String? message,
    String? code,
    bool? isLoading,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPass: confirmPass ?? this.confirmPass,
      changePassCode: changePassCode ?? this.changePassCode,
      code: code ?? this.code,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [email, password, confirmPass, changePassCode, code, isLoading];
}
