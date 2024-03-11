import 'package:boletera/src/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetCodeField extends StatelessWidget {
  const ResetCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        codeFormFields(context, 0),
        codeFormFields(context, 1),
        codeFormFields(context, 2),
        codeFormFields(context, 3),
        codeFormFields(context, 4),
        codeFormFields(context, 5),
      ],
    );
  }

  Widget codeFormFields(BuildContext context, int number) {
    final AuthBloc authBloc = context.watch<AuthBloc>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        width: 50,
        child: TextFormField(
          decoration: customDecoration('-', context),
          cursorColor: Colors.black,
          initialValue: '0',
          textAlign: TextAlign.center,
          maxLength: 1,
          onChanged: (value) => authBloc.changeResetCode(number, value.isEmpty ? 0 : int.parse(value)),
        ),
      ),
    );
  }

  customDecoration(String text, BuildContext context) {
    return InputDecoration(
      counterText: '',
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
      // labelText: text,
      labelStyle: Theme.of(context).textTheme.labelMedium,
    );
  }
}
