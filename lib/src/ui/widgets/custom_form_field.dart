import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String text;
  final bool visibilityIcon;
  final int fieldType;
  final bool isConfirmPass;
  final Function onChanged;

  const CustomFormField({
    required this.text,
    required this.onChanged,
    this.visibilityIcon = false,
    this.isConfirmPass = false,
    this.fieldType = 0,
    super.key,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _hidePassword;
  late DateTime? _date;

  @override
  void initState() {
    _hidePassword = true;
    _date = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        decoration: customDecoration(widget.text, context),
        cursorColor: Colors.black,
        obscureText: widget.fieldType == 2 ? _hidePassword : false,
        keyboardType: widget.fieldType == 1
            ? TextInputType.emailAddress
            : widget.fieldType == 2
                ? TextInputType.visiblePassword
                : widget.fieldType == 3
                    ? TextInputType.datetime
                    : TextInputType.multiline,
        maxLength: widget.fieldType == 1
            ? 100
            : widget.fieldType == 2
                ? 20
                : widget.fieldType == 4
                    ? 600
                    : 100,
        maxLines: widget.fieldType == 4 ? null : 1,
        validator: (value) {
          if (widget.fieldType == 1) {
            return _emailValidator(value!);
          } else if (widget.fieldType == 2) {
            return _passwordValidator(value!);
          }
          return null;
        },
        onChanged: (value) => widget.onChanged(value),
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
      counter: widget.fieldType == 4 ? null : const SizedBox(),
      suffixIcon: (widget.visibilityIcon) ? _selectIcon() : null,
    );
  }

  IconButton? _selectIcon() {
    switch (widget.fieldType) {
      case 2:
        return IconButton(
          icon: Icon(
            _hidePassword ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
        );
      case 3:
        return IconButton(
          icon: Icon(
            Icons.edit_calendar_outlined,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              keyboardType: TextInputType.datetime,
              initialDate: _date,
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 1),
              builder: (context, child) {
                final Color color = Theme.of(context).colorScheme.secondary;

                return Theme(
                  data: ThemeData.light().copyWith(
                    primaryColor: color,
                    colorScheme: ColorScheme.light(primary: color),
                    buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                  ),
                  child: child!,
                );
              },
            );

            if (pickedDate != null && pickedDate != _date) {
              setState(() {
                _date = pickedDate;
              });
            }
          },
        );
      default:
        return null;
    }
  }

// Email Field Validator
  String? _emailValidator(String email) {
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
  String? _passwordValidator(String pass) {
    if (pass.isEmpty) return 'Ingrese su contraseña';
    if (pass.length < 6) return 'La contraseña debe ser de 6 caracteres';
    return null;
  }
}
