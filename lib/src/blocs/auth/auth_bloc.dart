import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:boletera/src/services/services.dart';

import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> recoveryPassFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> changePassFormKey = GlobalKey<FormState>();

  AuthBloc() : super(const AuthState()) {
    on<LogIn>((event, emit) => emit(state.copyWith(email: event.email, password: event.password)));
    on<GetPassCode>((event, emit) => emit(state.copyWith(changePassCode: event.changePassCode)));
  }

  void resetState() {
    add(const LogIn('', ''));
    add(const GetPassCode([0, 0, 0, 0, 0, 0]));
  }

  void changeLoginData(String? email, String? password) {
    add(LogIn(email, password));
  }

  Future<bool> startSession(BuildContext context) async {
    if (loginFormKey.currentState!.validate()) {
      final GraphQLClient client = GraphQLProvider.of(context).value;

      client
          .query(QueryOptions(
        document: gql(GraphQLClients.startSession),
        variables: {
          'email': state.email,
          'pass': state.password,
        },
      ))
          .then((result) {
        if (result.hasException) {
          print('Ocurrio un problema en la llamada a Login');
        } else {
          if (result.data?['Login']['response']['status'] == 200) {
            //TODO: Guardar JWT en local storage
            return true;
          }
        }
      });
    }

    return false;
  }
}
