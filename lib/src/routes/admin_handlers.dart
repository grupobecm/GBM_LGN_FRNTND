import 'package:boletera/src/ui/views/auth/change_pass_view.dart';
import 'package:boletera/src/ui/views/change_pass_test.dart';
import 'package:boletera/src/ui/views/login_test.dart';
import 'package:fluro/fluro.dart';

import 'package:boletera/src/ui/views/views.dart';

class AdminHandlers {
  // static Handler login = Handler(handlerFunc: (context, parameters) => const LoginView(),type: HandlerType.route);
  static Handler login = Handler(handlerFunc: (context, parameters) => const LoginView());

  static Handler register = Handler(handlerFunc: (context, parameters) => const RegisterView());

  static Handler recoveryPass = Handler(handlerFunc: (context, parameters) => const RecoveryPassView());

  static Handler changePass = Handler(handlerFunc: (context, parameters) => const ChangePassView());

  static Handler testLogedIn = Handler(handlerFunc: (context, parameters) => const LoginTest());
  static Handler testChangePass = Handler(handlerFunc: (context, parameters) => const ChangePassTest());
}
