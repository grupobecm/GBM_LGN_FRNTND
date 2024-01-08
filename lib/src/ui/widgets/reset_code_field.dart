import 'package:boletera/src/providers/login_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetCodeField extends StatelessWidget {
  const ResetCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(
        builder: (context) {
          final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: 50,
                  child: TextFormField(
                    decoration: customDecoration('-', context),
                    cursorColor: Colors.black,
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    onChanged: (value) {
                      loginFormProvider.changecode(value.isEmpty ? 0 : int.parse(value), 1);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: 50,
                  child: TextFormField(
                    decoration: customDecoration('-', context),
                    cursorColor: Colors.black,
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    onChanged: (value) {
                      loginFormProvider.changecode(value.isEmpty ? 0 : int.parse(value), 2);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: 50,
                  child: TextFormField(
                    decoration: customDecoration('-', context),
                    cursorColor: Colors.black,
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    onChanged: (value) {
                      loginFormProvider.changecode(value.isEmpty ? 0 : int.parse(value), 3);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: 50,
                  child: TextFormField(
                    decoration: customDecoration('-', context),
                    cursorColor: Colors.black,
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    onChanged: (value) {
                      loginFormProvider.changecode(value.isEmpty ? 0 : int.parse(value), 4);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: 50,
                  child: TextFormField(
                    decoration: customDecoration('-', context),
                    cursorColor: Colors.black,
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    onChanged: (value) {
                      loginFormProvider.changecode(value.isEmpty ? 0 : int.parse(value), 5);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: 50,
                  child: TextFormField(
                    decoration: customDecoration('-', context),
                    cursorColor: Colors.black,
                    initialValue: '0',
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    onChanged: (value) {
                      loginFormProvider.changecode(value.isEmpty ? 0 : int.parse(value), 6);
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Widget codeFormFields(BuildContext context, int number, LoginFormProvider provider) {
  //   final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 30),
  //     child: SizedBox(
  //       width: 50,
  //       child: TextFormField(
  //         decoration: customDecoration('-', context),
  //         cursorColor: Colors.black,
  //         initialValue: '0',
  //         textAlign: TextAlign.center,
  //         maxLength: 1,
  //         onChanged: (value) {
  //           loginFormProvider.changecode(value.isEmpty ? 0 : int.parse(value), number);
  //         },
  //       ),
  //     ),
  //   );
  // }

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
