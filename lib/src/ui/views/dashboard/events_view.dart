import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();
    final ScrollController scrollController = ScrollController();

    return Column(
      children: [
        _HomeHeader(),
        const SizedBox(height: 10),
        Expanded(
          child: Query(
            options: QueryOptions(
              document: gql(GraphQLClients.getEvents),
              fetchPolicy: FetchPolicy.networkOnly,
            ),
            builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
              auxiliaryCubit.changeLoadingState(result.isLoading);

              if (result.hasException) {
                return const SizedBox();
              }

              if (result.isConcrete) {
                final list = result.data!['GetEvents'] ?? [];
                auxiliaryCubit.changeLoadingState(false);

                return GridView.extent(
                  controller: scrollController,
                  childAspectRatio: 450 / 300, // Ajusta este valor según tus necesidades
                  maxCrossAxisExtent: 600,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.all(20),
                  children: List.generate(
                    list.length,
                    (index) => EventCard(
                      event: list[index],
                    ),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}

class _HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            Center(child: Text('Mis eventos', style: Theme.of(context).textTheme.displayMedium)),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary)),
              onPressed: () => NavigationService.navigateTo(Flurorouter.createEventRoute, auxiliaryCubit),
              child: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //TODO: Agregar TextButton para filtros
            Text('En venta(0)'),
            Text('Pasados(0)'),
            Text('Todos(1)'),
          ],
        ),
      ],
    );
  }
}
