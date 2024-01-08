import 'package:boletera/src/routes/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

import 'package:boletera/src/routes/admin_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  // static String rootRoute = '/lo';

  // Auth Routes Declaration
  static String loginRoute = '/login';
  static String registerRoute = '/register';
  static String getResetCodeRoute = '/code';
  static String resetPassRoute = '/reset';
  static String testLogedIn = '/dashboard';

  // Dashboard Routes Declaration
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    // Auth Routes Definition
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.fadeIn);
    router.define(registerRoute, handler: AdminHandlers.recoveryCode, transitionType: TransitionType.fadeIn);
    router.define(testLogedIn, handler: AdminHandlers.testLogedIn, transitionType: TransitionType.fadeIn);
    // router.define(registerRoute, handler: _handler);
    // router.define(getResetCodeRoute, handler: _handler);
    // router.define(resetPassRoute, handler: _handler);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
