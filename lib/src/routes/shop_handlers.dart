import 'package:fluro/fluro.dart';

import 'package:boletera/src/ui/views/views.dart';

class ShopHandlers {
  static Handler shop = Handler(handlerFunc: (context, parameters) {
    return const MainShopView();
  });

  static Handler shopEvent = Handler(handlerFunc: (context, parameters) {
    return const ShopEventDetails();
  });

  static Handler ticketPurchase= Handler(handlerFunc: (context, parameters) {
    return const TicketPurchase();
  });
}
