part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String email;
  final String password;
  final String confirmPass;
  final List<int> changePassCode;
  final AuthStatus authStatus;
  final int viewMode;

// ChangePassCode Model
  static const List<int> defaultChangePassCode = [0, 0, 0, 0, 0, 0];

  const AuthState({
    this.email = '',
    this.password = '',
    this.confirmPass = '',
    this.changePassCode = defaultChangePassCode,
    this.authStatus = AuthStatus.checking,
    this.viewMode = 1,
  });

  AuthState copyWith({
    String? email,
    String? password,
    String? confirmPass,
    List<int>? changePassCode,
    AuthStatus? authStatus,
    int? viewMode,
    bool? loginView,
  }) =>
      AuthState(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPass: confirmPass ?? this.confirmPass,
        changePassCode: changePassCode ?? this.changePassCode,
        authStatus: authStatus ?? this.authStatus,
        viewMode: viewMode ?? this.viewMode,
      );

  @override
  List<Object> get props => [email, password, confirmPass, changePassCode, authStatus, viewMode];
}
