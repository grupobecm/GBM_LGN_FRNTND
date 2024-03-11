import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/ui/views/views.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

    if (auxiliaryCubit.state.actualLayout != Layout.dashboard) auxiliaryCubit.changeActualLayout(Layout.dashboard);
    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const MainShopView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const EventsView();
    return null;
  });

  static Handler createEvent = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

    if (auxiliaryCubit.state.actualLayout != Layout.dashboard) auxiliaryCubit.changeActualLayout(Layout.dashboard);
    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const MainShopView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const CreateEvent();
    return null;
  });

  static Handler eventDetails = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

    if (auxiliaryCubit.state.actualLayout != Layout.dashboard) auxiliaryCubit.changeActualLayout(Layout.dashboard);
    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const MainShopView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const EventDetails();
    return null;
  });

  static Handler calendar = Handler(handlerFunc: (context, parameters) {
    final AuthBloc authBloc = context!.watch<AuthBloc>();
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

    if (auxiliaryCubit.state.actualLayout != Layout.dashboard) auxiliaryCubit.changeActualLayout(Layout.dashboard);
    if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return const MainShopView();
    if (authBloc.state.authStatus == AuthStatus.authenticated) return const CalendarView();
    return null;
  });
}
