import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/utils/utils.dart';
import 'package:boletera/src/ui/views/views.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();

    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const LoginView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const EventsView();
    return null;
  });

  static Handler createEvent = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();

    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const LoginView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const CreateEvent();
    return null;
  });

  static Handler eventDetails = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();

    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const LoginView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const EventDetails();
    return null;
  });

  static Handler calendar = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();

    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const LoginView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const CalendarView();
    return null;
  });
}
