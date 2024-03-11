import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';
import 'package:boletera/src/ui/views/loader_view.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({
    required this.child,
    super.key,
  });

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  final graphQLClients = GraphQLClients();
  late ValueNotifier<GraphQLClient> _novekClient;

  @override
  void initState() {
    super.initState();
    _novekClient = ValueNotifier(GraphQLClient(link: graphQLClients.link, cache: GraphQLCache()));
  }

  @override
  Widget build(BuildContext context) {
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

    return BlocProvider(
      create: (_) => getIt<EventsBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const LogoImage(scale: 17.5, horizontalPadding: false),
              const SizedBox(width: 10),
              Container(
                height: 55,
                width: 1,
                color: Theme.of(context).dividerColor,
              ),
              const SizedBox(width: 10),
              CustomTextButton(
                text: 'Events',
                icon: Icons.event,
                onPressed: () => NavigationService.replaceTo(Flurorouter.eventsRoute, auxiliaryCubit),
              ),
              CustomTextButton(
                text: 'Calendar',
                icon: Icons.calendar_month,
                onPressed: () => NavigationService.replaceTo(Flurorouter.calendarRoute, auxiliaryCubit),
              ),
            ],
          ),
          elevation: 5,
        ),
        body: Column(
          children: [
            const _MultiColorBar(),
            Expanded(
              child: Row(
                children: [
                  // const LateralMenu(),
                  GraphQLProvider(
                    client: _novekClient,
                    child: Expanded(
                      child: ModalProgressHUD(
                        inAsyncCall: auxiliaryCubit.state.isLoading,
                        progressIndicator: const LoaderView(),
                        opacity: 0.15,
                        child: widget.child,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MultiColorBar extends StatelessWidget {
  const _MultiColorBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFFcf3d17))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFFeb6f30))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFFc63282))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFFbbad40))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFFe29c3a))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFF50a986))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFF454389))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFF643369))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFF6f3881))),
      ],
    );
  }
}
