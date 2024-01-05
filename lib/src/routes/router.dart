import 'package:boletera/src/routes/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

import 'package:boletera/src/routes/admin_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // Auth Routes Declaration
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';
  static String getResetCodeRoute = '/auth/code';
  static String resetPassRoute = '/auth/reset';

  // Dashboard Routes Declaration
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    // Auth Routes Definition
    router.define(rootRoute, handler: AdminHandlers.login);
    router.define(loginRoute, handler: AdminHandlers.login);
    // router.define(registerRoute, handler: _handler);
    // router.define(getResetCodeRoute, handler: _handler);
    // router.define(resetPassRoute, handler: _handler);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
