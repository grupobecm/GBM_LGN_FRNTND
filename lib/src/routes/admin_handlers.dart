import 'package:boletera/src/ui/views/login_test.dart';
import 'package:fluro/fluro.dart';

import 'package:boletera/src/ui/views/views.dart';

class AdminHandlers {
  // static Handler login = Handler(handlerFunc: (context, parameters) => const LoginView(),type: HandlerType.route);
  static Handler login = Handler(handlerFunc: (context, parameters) => const LoginView());

  static Handler register = Handler(handlerFunc: (context, parameters) => const RegisterView());

  static Handler recoveryCode = Handler(handlerFunc: (context, parameters) => const RecoveryPassView());

  static Handler resetPass = Handler(handlerFunc: (context, parameters) => const RegisterView());

  static Handler testLogedIn = Handler(handlerFunc: (context, parameters) => const LoginTest());
}
