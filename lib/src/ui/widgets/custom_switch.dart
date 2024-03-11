import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final String text;
  const CustomSwitch({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();

    _isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: _isSelected,
          inactiveThumbColor: Theme.of(context).colorScheme.inverseSurface,
          inactiveTrackColor: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.5),
          activeColor: Theme.of(context).colorScheme.secondary,
          trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
          onChanged: (value) => setState(() => _isSelected = !_isSelected),
        ),
        Text(widget.text, style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
