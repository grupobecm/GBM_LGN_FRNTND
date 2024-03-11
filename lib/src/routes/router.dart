import 'package:fluro/fluro.dart';

import 'package:boletera/src/routes/shop_handlers.dart';
import 'package:boletera/src/routes/auth_handlers.dart';
import 'package:boletera/src/routes/dashboard_handlers.dart';
import 'package:boletera/src/routes/no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  // late String actualRoute;

  // Auth Routes Declaration
  static String loginRoute = '/login';
  static String registerRoute = '/register';
  static String changePassRoute = '/code';
  static String recoveryPassRoute = '/reset';

  // Dashboard Routes Declaration
  static String eventsRoute = '/events';
  static String calendarRoute = '/calendar';

  // Event Route
  static String createEventRoute = '/events/create';
  static String eventDetailsRoute = '/events/details';

  // Shop Routes
  static String shopRoute = '/mx';
  static String shopEventRoute = '/mx/details';
  static String ticketPurchase = '/mx/purchase';

  static void configureRoutes() {
        // Auth Routes Definition
    router.define(loginRoute, handler: AuthHandlers.login, transitionType: TransitionType.fadeIn);
    router.define(registerRoute, handler: AuthHandlers.register, transitionType: TransitionType.fadeIn);
    router.define(changePassRoute, handler: AuthHandlers.changePass, transitionType: TransitionType.fadeIn, );
    router.define(recoveryPassRoute, handler: AuthHandlers.recoveryPass, transitionType: TransitionType.fadeIn);

    // Dashboard Routes Definition
    router.define(eventsRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.fadeIn);
    router.define(calendarRoute, handler: DashboardHandlers.calendar, transitionType: TransitionType.fadeIn);
    
    // Event Routes Definition
    router.define(createEventRoute , handler: DashboardHandlers.createEvent, transitionType: TransitionType.fadeIn);
    router.define(eventDetailsRoute, handler: DashboardHandlers.eventDetails, transitionType: TransitionType.fadeIn);

    //Shop Rputes Definition
    router.define(shopRoute, handler: ShopHandlers.shop, transitionType: TransitionType.fadeIn);
    router.define(shopEventRoute, handler: ShopHandlers.shopEvent, transitionType: TransitionType.fadeIn);
    router.define(ticketPurchase, handler: ShopHandlers.ticketPurchase, transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
