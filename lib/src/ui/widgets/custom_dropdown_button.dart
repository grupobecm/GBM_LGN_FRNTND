// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> items;
  final int typeButton;
  final String text;
  final Function onChanged;

  const CustomDropdownButton({
    required this.items,
    required this.typeButton,
    required this.text,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        labelText: text,
        labelStyle: Theme.of(context).textTheme.labelMedium,
      ),
      style: Theme.of(context).textTheme.labelMedium,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        // setState(() => _selectedItem = value!);

        switch (typeButton) {
          case 1:
            if (value == items[0]) onChanged('Private');
            if (value == items[1]) onChanged('Public');
            break;
          case 2:
            if (value == items[0]) onChanged('Open');
            if (value == items[1]) onChanged('Close');
            break;
          default:
            null;
        }
      },
    );
  }
}
