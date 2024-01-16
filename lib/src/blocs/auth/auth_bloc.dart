// ignore_for_file: use_build_context_synchronously
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
  final GlobalKey<FormState> recoveryCodeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> changePassFormKey = GlobalKey<FormState>();

  AuthBloc() : super(const AuthState()) {
    on<LogIn>((event, emit) => emit(state.copyWith(email: event.email, password: event.password)));
    on<GetPassCode>((event, emit) => emit(state.copyWith(changePassCode: event.changePassCode)));
    on<DefineMessage>((event, emit) => emit(state.copyWith(code: event.code)));
    on<LoadingProcess>((event, emit) => emit(state.copyWith(isLoading: event.isLoading)));
  }

  void resetState() {
    add(const LogIn('', ''));
    add(const GetPassCode([0, 0, 0, 0, 0, 0]));
  }

  void resetMessage() {
    add(const DefineMessage(''));
  }

  void changeLoginData(String? email, String? password) {
    add(LogIn(email, password));
  }

  void changeResetCode(int fieldNumber, int value) {
    List<int> list = state.changePassCode;

    list[fieldNumber] = value;

    add(GetPassCode(list));
  }

  void changeLoadingState(bool isLoading) {
    add(LoadingProcess(isLoading));
  }

  Future<bool> startSession(BuildContext context) async {
    if (!loginFormKey.currentState!.validate()) {
      return false;
    }

    try {
      final GraphQLClient client = GraphQLProvider.of(context).value;

      final result = await client.query(QueryOptions(
        document: gql(GraphQLClients.startSession),
        variables: {
          'email': state.email,
          'pass': state.password,
        },
      ));

      final int code = result.data?['Login']['response']['status'];
      add(DefineMessage(code.toString()));

      // TODO: Crear Clase manejadora de Mensajes y usarla. para evitar usar message en el bloc
      if (code == 200) {
        // TODO: Guardar JWT en local storage
        return true;
      }
    } catch (error) {
      add(DefineMessage('404'));
    }

    return false;
  }

  Future<bool> googleStartSession() async {
    //TODO: usar google_sign_in
    return false;
  }

  Future<bool> sendResetCodeEmail(BuildContext context) async {
    if (!recoveryCodeFormKey.currentState!.validate()) {
      return false;
    }

    final GraphQLClient client = GraphQLProvider.of(context).value;

    client
        .query(QueryOptions(
      document: gql(GraphQLClients.sendResetCodeEmail),
      variables: {
        'email': state.email,
      },
    ))
        .then((result) {
      if (result.data?['Generate_Code_Email_Recovery_Password']['status'] == 200) {
        return true;
      }
      if (result.hasException) {
        print('Ocurrio un problema al enviar el correo');
      }
    });

    return false;
  }

  Future<bool> setNewPass(BuildContext context) async {
    if (!changePassFormKey.currentState!.validate()) {
      return false;
    }

    if (state.password != state.confirmPass) {
      return false;
    }

    final GraphQLClient client = GraphQLProvider.of(context).value;
    final int code = int.parse(
      '${state.changePassCode[0]}${state.changePassCode[1]}${state.changePassCode[2]}${state.changePassCode[3]}${state.changePassCode[4]}${state.changePassCode[5]}',
    );

    client
        .query(QueryOptions(
      document: gql(GraphQLClients.sendResetCodeEmail),
      variables: {
        'email': state.email,
        'newpass': state.confirmPass,
        'code': code,
      },
    ))
        .then((result) {
      if (result.data?['RecoveryPassword']['status'] == 200) {
        return true;
      }
      if (result.hasException) {
        print('Ocurrió un problema al cambiar la contraseña');
      }
    });

    return false;
  }
}
