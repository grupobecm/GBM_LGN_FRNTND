import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String text;

  const CustomCheckbox({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _checkBoxValue;

  @override
  void initState() {
    _checkBoxValue = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.text),
      controlAffinity: ListTileControlAffinity.leading,
      checkColor: Theme.of(context).colorScheme.secondary,
      activeColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
      value: _checkBoxValue,
      onChanged: (value) {
        setState(() {
          _checkBoxValue = value!;
        });
      },
    );
  }
}
