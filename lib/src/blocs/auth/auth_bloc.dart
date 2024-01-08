import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LogIn>((event, emit) => emit(state.copyWith(email: event.email, password: event.password)));
    on<GetPassCode>((event, emit) => emit(
          state.copyWith(
            resetCode1: event.resetCode1,
            resetCode2: event.resetCode2,
            resetCode3: event.resetCode3,
            resetCode4: event.resetCode4,
            resetCode5: event.resetCode5,
            resetCode6: event.resetCode6,
          ),
        ));
  }

  void resetState() {
    add(const LogIn('', ''));
    add(const GetPassCode(0, 0, 0, 0, 0, 0));
  }

  void changeLoginData(String? email, String? password) {
    add(LogIn(email, password));
    print('email: ${state.email}');
  }
}
