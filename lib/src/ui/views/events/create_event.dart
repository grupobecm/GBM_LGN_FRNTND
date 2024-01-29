import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late int activeStep;

  @override
  void initState() {
    activeStep = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Center(
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.3,
            child: EasyStepper(
              activeStep: activeStep,
              borderThickness: 5,
              enableStepTapping: false,
              alignment: Alignment.center,
              direction: Axis.vertical,
              lineStyle: const LineStyle(),
              activeStepBorderColor: Theme.of(context).colorScheme.secondary,
              finishedStepBorderColor: Theme.of(context).colorScheme.secondaryContainer,
              // unreachedStepBorderColor: Theme.of(context).colorScheme.secondaryContainer,
              defaultStepBorderType: BorderType.normal,
              steps: [
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  customTitle: Text('Event Data', style: Theme.of(context).textTheme.bodyMedium),
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  title: 'Event Fases',
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  title: 'Event Lineup',
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}
