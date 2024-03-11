import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/blocs/blocs.dart';

import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late GlobalKey<FormState> formKey;
  final ScrollController scrollController = ScrollController();

  final AuxiliaryCubit _aixiliaryCubit;

  AuthBloc({
    required AuxiliaryCubit auxiliaryCubit,
  })  : _aixiliaryCubit = auxiliaryCubit,
        super(const AuthState()) {
    on<LogIn>((event, emit) => emit(state.copyWith(email: event.email, password: event.password)));
    on<GetPassCode>((event, emit) => emit(state.copyWith(changePassCode: event.changePassCode)));
    on<VerifyAuth>((event, emit) => emit(state.copyWith(authStatus: event.authStatus)));
    on<SelectViewMode>((event, emit) => emit(state.copyWith(viewMode: event.viewMode)));
    isAuthenticated();
  }


  void resetState() {
    add(const LogIn('', ''));
    add(const GetPassCode([0, 0, 0, 0, 0, 0]));
  }

  void resetFormKey(GlobalKey<FormState> key) {
    formKey = key;
  }

  void changeViewMode(int mode) {
    add(SelectViewMode(mode));
  }

  void changeLoginData(String? email, String? password) {
    add(LogIn(email, password));
  }

  void changeResetCode(int fieldNumber, int value) {
    List<int> list = state.changePassCode;

    list[fieldNumber] = value;

    add(GetPassCode(list));
  }

  // void changeLoadingState(bool isLoading) {
  //   add(LoadingProcess(isLoading));
  // }

  void changeAuthenticationState(AuthStatus authStatus) {
    add(VerifyAuth(authStatus));
  }

  Future<bool> isAuthenticated() async {
    final jwt = LocalStorage.sharedPreferences.getString('jwt');

    if (jwt == null) {
      changeAuthenticationState(AuthStatus.notAuthenticated);
      return false;
    }

    //TODO: Autenticar token en Back

    changeAuthenticationState(AuthStatus.authenticated);
    return true;
  }

  Future<void> startSession(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    _aixiliaryCubit.changeLoadingState(true);

    try {
      final GraphQLClient client = GraphQLProvider.of(context).value;

      final result = await client.query(QueryOptions(
        document: gql(GraphQLClients.startSession),
        fetchPolicy: FetchPolicy.networkOnly,
        variables: {
          'email': state.email,
          'pass': state.password,
        },
        context: const Context(),
      ));

      if (!result.hasException) {
        _aixiliaryCubit.changeCode('200'); //TODO: Obtener el codigo cuando es un error
        LocalStorage.sharedPreferences.setString('jwt', result.data?['Login']);
      } else {
        _aixiliaryCubit.changeCode('404');
      }
    } catch (error) {
      _aixiliaryCubit.changeCode('000');
      _aixiliaryCubit.changeLoadingState(false);
    }
    _aixiliaryCubit.changeLoadingState(false);
  }

  Future<bool> googleStartSession() async {
    //TODO: usar google_sign_in
    return false;
  }

  Future<bool> sendResetCodeEmail(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    try {
      final GraphQLClient client = GraphQLProvider.of(context).value;

      final result = await client.query(QueryOptions(
        document: gql(GraphQLClients.sendResetCodeEmail),
        variables: {
          'email': state.email,
        },
      ));

      if (!result.hasException) {
        _aixiliaryCubit.changeCode('200'); //TODO: Obtener el codigo cuando es un error
        return true;
      } else {
        _aixiliaryCubit.changeCode('404');
      }
    } catch (error) {
      _aixiliaryCubit.changeCode('000');
    }

    return false;
  }

  Future<bool> setNewPass(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    if (state.password != state.confirmPass) {
      return false;
    }

    try {
      final GraphQLClient client = GraphQLProvider.of(context).value;
      final int passCode = int.parse(
        '${state.changePassCode[0]}${state.changePassCode[1]}${state.changePassCode[2]}${state.changePassCode[3]}${state.changePassCode[4]}${state.changePassCode[5]}',
      );

      final result = await client.query(QueryOptions(
        document: gql(GraphQLClients.sendResetCodeEmail),
        variables: {
          'email': state.email,
          'newpass': state.confirmPass,
          'code': passCode,
        },
      ));

      if (!result.hasException) {
        _aixiliaryCubit.changeCode('200'); //TODO: Obtener el codigo cuando es un error
        return true;
      } else {
        _aixiliaryCubit.changeCode('404');
      }
    } catch (error) {
      _aixiliaryCubit.changeCode('000');
    }

    return false;
  }
}
