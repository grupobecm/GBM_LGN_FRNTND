import 'package:get_it/get_it.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/services/services.dart';

GetIt getIt = GetIt.instance;

Future<void> servicesLocatorInit() async {
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();

  getIt.registerSingleton(AuxiliaryCubit());
  getIt.registerSingleton(AuthBloc(
    auxiliaryCubit: getIt<AuxiliaryCubit>(),
  ));
  getIt.registerSingleton(EventsBloc(
    auxiliaryCubit: getIt<AuxiliaryCubit>(),
  ));
  getIt.registerSingleton(PurchaseCubit(
    auxiliaryCubit: getIt<AuxiliaryCubit>(),
  ));
}
