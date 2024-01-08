import 'package:boletera/src/providers/login_form_provider.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String text;
  final bool visibilityIcon;
  final int validationTipe;
  final dynamic provider;

  const CustomFormField({
    super.key,
    required this.text,
    this.visibilityIcon = false,
    this.validationTipe = 0,
    this.provider
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _hidePassword;

  @override
  void initState() {
    _hidePassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        decoration: customDecoration(widget.text, context),
        cursorColor: Colors.black,
        // ignore: unnecessary_null_comparison
        validator: (value) {
          if (widget.validationTipe == 1) {
            return emailValidator(value!);
          } else if (widget.validationTipe == 2) {
            return passwordValidator(value!);
          }
          return null;
        },
        onChanged: (value) => (widget.validationTipe == 1) ? widget.provider.email = value : widget.provider.password = value,
      ),
    );
  }

  customDecoration(String text, BuildContext context) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      labelText: text,
      labelStyle: Theme.of(context).textTheme.labelMedium,
      suffixIcon: (widget.visibilityIcon)
          ? IconButton(
              icon: Icon(
                _hidePassword ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
              onPressed: () {
                setState(() {
                  _hidePassword = !_hidePassword;
                });
              },
            )
          : null,
    );
  }

  // TODO: Optimizar
  String? emailValidator(String email) {
    Pattern pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

    if (email.isEmpty) return 'Ingrese su correo';

    final regex = RegExp(pattern.toString());
    if (!regex.hasMatch(email)) return 'Formato de correo no valido';

    return null;
  }

// Password Field Validator.
  String? passwordValidator(String pass) {
    if (pass.isEmpty) return 'Ingrese su contraseña';
    if (pass.length < 6) return 'La contraseña debe ser de 6 caracteres';
    return null;
  }
}
