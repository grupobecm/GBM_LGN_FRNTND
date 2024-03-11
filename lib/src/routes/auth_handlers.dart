import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/ui/views/views.dart';

class AuthHandlers {
  static Handler login = Handler(type: HandlerType.route, handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();
    authBloc.changeViewMode(1);

    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const LoginView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const EventsView();
    return null;
  });

  static Handler register = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();
    authBloc.changeViewMode(2);

    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const RegisterView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const EventsView();
    return null;
  });

  static Handler recoveryPass = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();
    authBloc.changeViewMode(3);

    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const RecoveryPassView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const EventsView();
    return null;
  });

  static Handler changePass = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();
    authBloc.changeViewMode(3);

    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const ChangePassView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const EventsView();
    return null;
  });
}
