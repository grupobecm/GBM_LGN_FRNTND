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
            child: CustomStepper(index: activeStep),
          ),
        ),
        Expanded(
          child: Container(),
        )
      ],
    );
  }
}
