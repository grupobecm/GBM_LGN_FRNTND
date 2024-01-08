import 'package:boletera/src/services/graphql_service.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Future<bool> validateForm() async {
    if (formKey.currentState!.validate()) {
      final GraphQlService graphQlService = GraphQlService();
      return await graphQlService.startSession(email, password);
    } else {
      print('Form no valido');
    }

    return false;
  }
}
