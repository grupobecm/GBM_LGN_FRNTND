import 'package:boletera/src/blocs/blocs.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigateTo(String routeName, AuxiliaryCubit auxiliaryCubit) {
    selectLayout(routeName, auxiliaryCubit);
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static replaceTo(String routeName, AuxiliaryCubit auxiliaryCubit) {
    selectLayout(routeName, auxiliaryCubit);
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static goBack() {
    return navigatorKey.currentState!.pop();
  }

  static selectLayout(String routeName, AuxiliaryCubit auxiliaryCubit) {
    switch (routeName) {
      case '/login' || '/register' || '/code' || '/reset':
        auxiliaryCubit.changeActualLayout(Layout.auth);
        break;
      case '/events' || '/calendar' || '/events/create' || '/events/details':
        auxiliaryCubit.changeActualLayout(Layout.dashboard);
        break;
      case '/mx':
        auxiliaryCubit.changeActualLayout(Layout.shop);
        break;
      default:
    }
  }
}
