import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:boletera/src/utils/utils.dart';
import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/ui/views/views.dart';

class AuthHandlers {
  static Handler login = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();

    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const LoginView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const HomeView();
    return null;
  });

  static Handler register = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();

    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const RegisterView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const HomeView();
    return null;
  });

  static Handler recoveryPass = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();

    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const RecoveryPassView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const HomeView();
    return null;
  });

  static Handler changePass = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();

    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const ChangePassView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const HomeView();
    return null;
  });
}
