import 'package:flutter/material.dart';

class UnderlineFormField extends StatelessWidget {
  final String text;
  final IconData? icon;

  const UnderlineFormField({
    required this.text,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: text,
          labelStyle: Theme.of(context).textTheme.labelMedium,
          counter: const SizedBox(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 4),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: icon != null ? Icon(icon) : null,
        ),
      ),
    );
  }
}
