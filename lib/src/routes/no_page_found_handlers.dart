import 'package:fluro/fluro.dart';

import 'package:boletera/src/ui/views/views.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(
    handlerFunc: (context, parameters) => const NoPageFoundView(),
    type: HandlerType.route,
  );
}
