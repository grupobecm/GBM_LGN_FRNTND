import 'package:get_it/get_it.dart';

import 'package:boletera/src/blocs/blocs.dart';

GetIt getIt = GetIt.instance;

Future<void> blocLocatorInit() async {

  getIt.registerSingleton(MessageCubit());
  getIt.registerSingleton(AuthBloc(
    messageCubit: getIt<MessageCubit>(),
  ));
}
