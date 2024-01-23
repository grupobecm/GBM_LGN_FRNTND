import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:boletera/src/utils/utils.dart';
import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/layouts/layouts.dart';
import 'package:boletera/src/theme/color_schemas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setupLocator(); //TODO: Revisar tema de las Global keys
  // await dotenv.load(fileName: ".env");
  await servicesLocatorInit();

  runApp(const BlocsProvider());
}

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => getIt<MessageCubit>()),
      BlocProvider(create: (_) => getIt<AuthBloc>(), lazy: false),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        final AuthBloc authBloc = context.watch<AuthBloc>();

        return DashboardLayout(child: child!);

        if (authBloc.state.authStatus == AuthStatus.checking) return const SplashLayout();
        if (authBloc.state.authStatus == AuthStatus.authenticated)
          return DashboardLayout(child: child!).animate().fadeIn(duration: 1000.ms);
        if (authBloc.state.authStatus == AuthStatus.notAuthenticated) return AuthLayout(child: child!);
        return const SizedBox();
      },
    ).animate().fadeIn(
          duration: 1500.ms,
        );
  }
}
