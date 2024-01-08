import 'package:boletera/src/services/graphql_service.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String confirmPass = '';
  int resetCode1 = 0;
  int resetCode2 = 0;
  int resetCode3 = 0;
  int resetCode4 = 0;
  int resetCode5 = 0;
  int resetCode6 = 0;

  void changecode(int value, int number) {
    switch (number) {
      case 1:
        resetCode1 = value;
      case 2:
        resetCode2 = value;
      case 3:
        resetCode3 = value;
      case 4:
        resetCode4 = value;
      case 5:
        resetCode5 = value;
      case 6:
        resetCode6 = value;
    }

    notifyListeners();
  }

  Future<bool> validateForm() async {
    if (formKey.currentState!.validate()) {
      final GraphQlService graphQlService = GraphQlService();
      return await graphQlService.startSession(email, password);
    } else {
      // print('Form no valido');
    }

    return false;
  }

  Future<bool> getResetCode() async {
    if (formKey.currentState!.validate()) {
      final GraphQlService graphQlService = GraphQlService();
      return await graphQlService.sendPwCodeEmail(email);
    } else {
      // print('Form no valido');
    }

    return false;
  }

  Future<bool> setNewPass() async {
    if (formKey.currentState!.validate()) {
      if (password == confirmPass) {
        final GraphQlService graphQlService = GraphQlService();
        final int code = int.parse('$resetCode1$resetCode2$resetCode3$resetCode4$resetCode5$resetCode6');
        return await graphQlService.changePassWord(email, confirmPass, code);
      }
    } else {
      // print('Form no valido');
    }

    return false;
  }
}
