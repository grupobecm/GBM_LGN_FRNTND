import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class EditCodeView extends StatelessWidget {
  const EditCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return (size.width > 1000) ? const _DesktopView() : const _MobileView();
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventsBloc eventsBloc = context.watch<EventsBloc>();
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();
    final ScrollController scrollController = ScrollController();

    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomGradientButton(
                  onPressed: () => NavigationService.goBack(),
                  text: 'Regresar',
                  icon: Icons.arrow_back_ios_new_outlined,
                ),
                const Spacer(),
                CustomFlatButton(
                  icon: Icons.add,
                  text: 'Agregar código',
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {},
                ),
                const Spacer(),
              ],
            ),
          ),
          Expanded(
            child: Query(
              options: QueryOptions(
                document: gql(GraphQLClients.getPhases),
                variables: {
                  'id': eventsBloc.state.event.eventID,
                },
                fetchPolicy: FetchPolicy.networkOnly,
                pollInterval: const Duration(seconds: 10),
              ),
              builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
                if (result.data == null) {
                  auxiliaryCubit.changeLoadingState(true);
                  return const SizedBox();
                } else {
                  final list = result.data!['GetPhases'] ?? [];
                  auxiliaryCubit.changeLoadingState(false);

                  return ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(20),
                    children: List.generate(
                      list.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
                        child: PhaseCard(
                          phase: list[index],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final EventsBloc eventsBloc = context.watch<EventsBloc>();

    return Container();
  }
}
