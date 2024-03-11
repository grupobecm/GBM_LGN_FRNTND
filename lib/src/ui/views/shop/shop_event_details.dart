import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/services/navigation_service.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopEventDetails extends StatelessWidget {
  const ShopEventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.width * 0.36,
            child: const CarouselCard(),
          ),
          const SubtitleDivider(text: 'Selecciona tus Boletos'),
          const _PhasesList(),
          const _TotalsBar(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
            child: Row(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}

class _PhasesList extends StatelessWidget {
  const _PhasesList();

  @override
  Widget build(BuildContext context) {
    final EventsBloc eventsBloc = context.watch<EventsBloc>();

    return BlocBuilder<EventsBloc, EventsState>(
      builder: (context, state) {
        if (state.event.phases!.isEmpty) {
          eventsBloc.getPhases('1', context);
          return const SizedBox();
        } else {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.event.phases!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: ListTile(
                      title: Text(state.event.phases![index].name!, style: Theme.of(context).textTheme.titleMedium),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('\$ ${state.event.phases![index].price!}',
                              style: Theme.of(context).textTheme.labelMedium),
                          const SizedBox(height: 20),
                          Text(state.event.phases![index].description!, style: Theme.of(context).textTheme.labelMedium),
                        ],
                      ),
                      trailing: const Text('Botones'),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}

class _TotalsBar extends StatelessWidget {
  const _TotalsBar();

  @override
  Widget build(BuildContext context) {
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Subtotal: ', style: Theme.of(context).textTheme.bodySmall),
                  Text('Total: ', style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              CustomGradientButton(
                text: 'Adquirir Boletos',
                isRectangular: true,
                onPressed: () {
                  NavigationService.navigateTo(Flurorouter.ticketPurchase, auxiliaryCubit);
                },
              ),
            ],
          ),
          // child: Text(text, style: Theme.of(context).textTheme.titleMedium),
        ),
      ),
    );
  }
}
