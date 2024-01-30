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
    activeStep = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: size.width * 0.3,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: RepaintBoundary(child: CustomStepper(index: activeStep)),
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Card(
              elevation: 5,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: EventGeneralDataView(),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
