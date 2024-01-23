import 'package:boletera/src/routes/dashboard_handlers.dart';
import 'package:boletera/src/routes/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

import 'package:boletera/src/routes/auth_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  // late String actualRoute;

  // Auth Routes Declaration
  static String loginRoute = '/login';
  static String registerRoute = '/register';
  static String changePassRoute = '/code';
  static String recoveryPassRoute = '/reset';

  // Dashboard Routes Declaration
  static String homeRoute = '/home';

  // Event Route
  static String eventRoute = '/event/create';
  static String updatEeventRoute = '/event/update';

  static void configureRoutes() {
    // Auth Routes Definition
    router.define(loginRoute, handler: AuthHandlers.login, transitionType: TransitionType.fadeIn);
    router.define(registerRoute, handler: AuthHandlers.register, transitionType: TransitionType.fadeIn);
    router.define(changePassRoute, handler: AuthHandlers.changePass, transitionType: TransitionType.fadeIn);
    router.define(recoveryPassRoute, handler: AuthHandlers.recoveryPass, transitionType: TransitionType.fadeIn);

    // Event Routes Definition
    router.define(homeRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.fadeIn);
    router.define(eventRoute, handler: DashboardHandlers.event, transitionType: TransitionType.fadeIn);
    router.define(updatEeventRoute, handler: DashboardHandlers.updateEvent, transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
