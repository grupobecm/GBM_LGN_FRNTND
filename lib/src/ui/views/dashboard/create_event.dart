import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/ui/views/views.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final EventsBloc eventsBloc = context.watch<EventsBloc>();
    final Size size = MediaQuery.of(context).size;

    return (size.width > 1000)
        ? _DesktopView(activeStep: eventsBloc.state.step)
        : _MobileView(activeStep: eventsBloc.state.step);
  }
}

class _DesktopView extends StatelessWidget {
  final int activeStep;
  const _DesktopView({
    required this.activeStep,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: size.height * 0.9, maxWidth: size.width * 0.8),
        child: Card(
          elevation: 5,
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.3,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: CustomStepper(index: activeStep, direction: Axis.vertical),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.1),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                              child: selectStepView(activeStep),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ButtonsPanel(),
                    const SizedBox(height: 20)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget selectStepView(int step) {
    switch (step) {
      case 0:
        return const CreateGeneralDataView();
      case 1:
        return const CreateAreaView();
      case 2:
        return const CreatePhaseView();
      case 3:
        return const CreateLineUpView();
      default:
        return const CreateGeneralDataView();
    }
  }
}

class _MobileView extends StatelessWidget {
  final int activeStep;
  const _MobileView({
    required this.activeStep,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: size.height * 0.9, maxWidth: size.width * 0.8),
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              const SizedBox(height: 40),
              SizedBox(
                width: size.width * 0.3,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: CustomStepper(
                    index: activeStep,
                    direction: Axis.horizontal,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.1),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: selectStepView(activeStep),
                      ),
                    ),
                  ),
                ),
              ),
              ButtonsPanel(),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Widget selectStepView(int step) {
    switch (step) {
      case 0:
        return const CreateGeneralDataView();
      case 1:
        return const CreateAreaView();
      case 2:
        return const CreatePhaseView();
      case 3:
        return const CreateLineUpView();
      default:
        return const CreateGeneralDataView();
    }
  }
}
