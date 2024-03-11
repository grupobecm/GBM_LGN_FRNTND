import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CustomStepper extends StatelessWidget {
  final int index;
  final Axis direction;

  const CustomStepper({super.key, required this.index, required this.direction});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> list = [
      {'title': AppLocalizations.of(context)!.stepOne, 'icon': Icons.looks_one_outlined},
      {'title': AppLocalizations.of(context)!.stepTwo, 'icon': Icons.looks_two_outlined},
      {'title': AppLocalizations.of(context)!.stepThree, 'icon': Icons.looks_3_outlined},
      {'title': AppLocalizations.of(context)!.stepFour, 'icon': Icons.looks_4_outlined},
    ];

    return EasyStepper(
      activeStep: index,
      stepShape: StepShape.circle,
      direction: direction,
      unreachedStepBorderColor: Theme.of(context).colorScheme.secondary,
      activeStepBorderColor: Theme.of(context).colorScheme.secondary,
      finishedStepBorderColor: Theme.of(context).colorScheme.secondary,
      activeStepBackgroundColor: Theme.of(context).colorScheme.secondary,
      finishedStepBackgroundColor: Theme.of(context).colorScheme.secondary,
      activeStepTextColor: Theme.of(context).colorScheme.secondary,
      finishedStepTextColor: Theme.of(context).colorScheme.inverseSurface,
      unreachedStepTextColor: Theme.of(context).colorScheme.tertiary,
      unreachedStepIconColor: Theme.of(context).colorScheme.secondary,
      activeStepIconColor: Theme.of(context).colorScheme.secondary,
      finishedStepIconColor: Theme.of(context).colorScheme.primary,
      defaultStepBorderType: BorderType.normal,
      enableStepTapping: false,
      showScrollbar: false,
      disableScroll: true,
      stepRadius: 25,
      borderThickness: 4,
      fitWidth: false,
      lineStyle: LineStyle(
        lineType: LineType.normal,
        activeLineColor: Theme.of(context).colorScheme.secondary,
        defaultLineColor: Theme.of(context).colorScheme.secondary,
        finishedLineColor: Theme.of(context).colorScheme.secondary,
        unreachedLineColor: Theme.of(context).colorScheme.secondary,
        lineSpace: 0,
        progress: 0.5,
        lineThickness: 2,
      ),
      steps: List.generate(
        list.length,
        (index) => customStep(
          list[index]['icon'],
          list[index]['title'],
        ),
      ),
    );
  }

  EasyStep customStep(IconData icon, String title) {
    return EasyStep(
      icon: Icon(icon),
      finishIcon: const Icon(Icons.check),
      title: title,
      enabled: true,
      customTitle: (direction == Axis.horizontal) ? Text(title, softWrap: true, textAlign: TextAlign.center) : null,
    );
  }
}
