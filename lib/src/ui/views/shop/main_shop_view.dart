import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';
import 'package:boletera/src/ui/widgets/custom_form_field.dart';

class MainShopView extends StatelessWidget {
  const MainShopView({super.key});

  @override
  Widget build(BuildContext context) {
    // final EventsBloc eventsBloc = context.watch<EventsBloc>();
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();
    // final ScrollController scrollController = ScrollController();

    final Size size = MediaQuery.of(context).size;

    return Query(
      options: QueryOptions(
          document: gql(GraphQLClients.getEventsShop),
          fetchPolicy: FetchPolicy.networkOnly,
          errorPolicy: ErrorPolicy.all),
      builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
        // auxiliaryCubit.changeLoadingState(result.isLoading);

        // if (result.hasException) {
        //   return const SizedBox();
        // }

        // if (result.isConcrete) {
        //   final list = result.data!['GetEvents'] ?? [];

        return SingleChildScrollView(
          child: Column(
            children: [
              FlutterCarousel(
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 8),
                    // height: size.height * 0.7,
                    height: size.width * 0.36,
                    viewportFraction: 1.0),
                items: const [
                  CarouselCard(),
                  CarouselCard(),
                  CarouselCard(),
                ],
              ),
              const SubtitleDivider(text: 'Eventos Próximos'),

              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/img-banner-home.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(
                          5,
                          (index) => const SmallEventCard(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SubtitleDivider(text: 'Eventos Pasados'),
              const BottomCarouselCard(events: []),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 500,
                color: Theme.of(context).colorScheme.primary,
                child: Image.asset(
                  'assets/images/img-banner-home.png',
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                height: 300,
                color: Theme.of(context).colorScheme.secondary,
              )

              // Container(
              //   color: Colors.amber,
              //   width: size.width * 0.9,
              //   // constraints: const BoxConstraints(minHeight: 300, maxHeight: 800),
              //   child: ListView(
              //     scrollDirection: Axis.vertical,
              //     children: [
              //       Wrap(
              //         alignment: WrapAlignment.center, // Centra los elementos en la cuadrícula
              //         children: List.generate(
              //           10, // Número total de elementos
              //           (index) => Container(
              //             // Usa cualquier widget que desees mostrar en la cuadrícula
              //             width: 100, // Ancho de cada elemento
              //             height: 100, // Altura de cada elemento
              //             color: Colors.blue, // Color de fondo
              //             margin: EdgeInsets.all(8), // Margen entre elementos
              //             child: Center(
              //               child: Text(
              //                 'Item $index',
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Expanded(
              //   child: ListView(
              //     scrollDirection: Axis.horizontal, // Asegúrate de que la lista sea horizontal
              //     children: [
              //       Wrap(
              //         alignment: WrapAlignment.center, // Centra los elementos en la cuadrícula
              //         children: List.generate(
              //           10, // Número total de elementos
              //           (index) => Container(
              //             // Usa cualquier widget que desees mostrar en la cuadrícula
              //             width: 100, // Ancho de cada elemento
              //             height: 100, // Altura de cada elemento
              //             color: Colors.blue, // Color de fondo
              //             margin: EdgeInsets.all(8), // Margen entre elementos
              //             child: Center(
              //               child: Text(
              //                 'Item $index',
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        );
        // }
        auxiliaryCubit.changeLoadingState(false);
        return const SizedBox();
      },
    );
  }
}
