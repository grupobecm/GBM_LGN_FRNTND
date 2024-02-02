// ignore_for_file: unused_element

import 'package:boletera/src/ui/views/events/event_general_data_view.dart';
import 'package:flutter/material.dart';

import 'package:boletera/src/ui/widgets/widgets.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late int activeStep;

  @override
  void initState() {
    activeStep = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return (size.width > 1000) ? _DesktopView(activeStep: activeStep) : _MobileView(activeStep: activeStep);
  }
}

class _DesktopView extends StatelessWidget {
  final int activeStep;
  const _DesktopView({
    super.key,
    required this.activeStep,
  });

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
                          child: const SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                              child: EventGeneralDataView(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const ButtonsPanel(),
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
}

class _MobileView extends StatelessWidget {
  final int activeStep;
  const _MobileView({
    super.key,
    required this.activeStep,
  });

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
                    child: const SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: EventGeneralDataView(),
                      ),
                    ),
                  ),
                ),
              ),
              const ButtonsPanel(),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
