import 'package:boletera/src/blocs/messages/messages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/layouts/layouts.dart';
import 'package:boletera/src/theme/color_schemas.dart';

void main() async {
  // setupLocator(); //TODO: Revisar tema de las Global keys
  Flurorouter.configureRoutes();
  await blocLocatorInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MessageCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Novek Ticket Panel',
        theme: lightTheme,
        // darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          // Locale('en'),
          Locale('es'),
          // Locale('fr'),
        ],
        initialRoute: Flurorouter.loginRoute,
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: NavigationService.navigatorKey,
        builder: (_, child) {
          // return AuthLayout(child: child!);
          return const DashboardLayout();
        },
      ).animate().fadeIn(
            duration: 1500.ms,
          ),
    );
  }
}
