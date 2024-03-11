import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String text;
  final bool visibilityIcon;
  final int fieldType;
  final bool isConfirmPass;
  final Function onChanged;
  final IconData? prefix;

  const CustomFormField({
    required this.text,
    required this.onChanged,
    this.visibilityIcon = false,
    this.isConfirmPass = false,
    this.fieldType = 0,
    this.prefix,
    super.key,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _hidePassword;
  // late DateTime? _date;
  late TextEditingController _controller;

  @override
  void initState() {
    _hidePassword = true;
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: _controller,
        decoration: customDecoration(widget.text, context),
        cursorColor: Colors.black,
        obscureText: widget.fieldType == 2 ? _hidePassword : false,
        keyboardType: widget.fieldType == 1
            ? TextInputType.emailAddress
            : widget.fieldType == 2
                ? TextInputType.visiblePassword
                : widget.fieldType == 3
                    ? TextInputType.datetime
                    : widget.fieldType == 5 || widget.fieldType == 6
                        ? TextInputType.number
                        : TextInputType.multiline,
        maxLength: widget.fieldType == 1
            ? 100
            : widget.fieldType == 2
                ? 20
                : widget.fieldType == 4
                    ? 600
                    : 100,
        maxLines: widget.fieldType == 4 ? null : 1,
        inputFormatters: widget.fieldType == 5 || widget.fieldType == 6
            ? <TextInputFormatter>[
                widget.fieldType == 5
                    ? FilteringTextInputFormatter.digitsOnly
                    : FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))
              ]
            : null,
        onTap: () async {
          if (widget.fieldType == 3) {
            //TODO: Center Build
            final DateTime? pickedDate = await showBoardDateTimePicker(
              context: context,
              useRootNavigator: true,
              pickerType: DateTimePickerType.datetime,
              minimumDate: DateTime(DateTime.now().year),
              maximumDate: DateTime(DateTime.now().year + 1, 12),
              initialDate: DateTime.now(),
              radius: 10,
              useSafeArea: true,
              options: BoardDateTimeOptions(
                activeColor: Theme.of(context).colorScheme.secondary,
                customOptions: BoardPickerCustomOptions.every15minutes(),
                backgroundDecoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2)),
              ),
            );

            if (pickedDate != null) {
              String formattedDateTime = '${DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ").format(pickedDate.toUtc())}Z';
              _controller.text = formattedDateTime;
              widget.onChanged(formattedDateTime);
            }
          }
        },
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
      prefixIcon: widget.prefix != null ? Icon(widget.prefix) : null,
      prefixIconColor: Theme.of(context).colorScheme.secondary,
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

  Widget? _selectIcon() {
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
        return Icon(
          Icons.edit_calendar_outlined,
          color: Theme.of(context).colorScheme.inverseSurface,
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

  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ");
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    newText = newText.padLeft("yyyy-MM-ddTHH:mm:ss.SSSZ".length, '0');
    final dateTime = dateFormat.parseStrict(newText);
    final formatted = dateFormat.format(dateTime);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class CustomDateInputFormatter extends TextInputFormatter {
  final String formatPattern;

  CustomDateInputFormatter({required this.formatPattern});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final dateFormat = DateFormat(formatPattern);
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    newText = newText.padLeft(formatPattern.length, '0');
    final dateTime = dateFormat.parseStrict(newText);
    final formatted = dateFormat.format(dateTime);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
