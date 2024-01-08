import 'package:get_it/get_it.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/services/graphql_service.dart';

GetIt getIt = GetIt.instance;

Future<void> blocLocatorInit() async {
  final GraphQlService graphQlService = GraphQlService();

  getIt.registerSingleton(AuthBloc());
}
