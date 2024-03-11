import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/theme/color_schemas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setupLocator();
  await dotenv.load(fileName: ".env");
  await servicesLocatorInit();
  Stripe.publishableKey = dotenv.env['STRIPEKEY']!;
  await Stripe.instance.applySettings();

  runApp(const BlocsProvider());
}

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => getIt<AuxiliaryCubit>(), lazy: false),
      BlocProvider(create: (_) => getIt<AuthBloc>(), lazy: false),
      BlocProvider(create: (_) => getIt<EventsBloc>(), lazy: false),
      BlocProvider(create: (_) => getIt<PurchaseCubit>(), lazy: false),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

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
      initialRoute: Flurorouter.shopRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      builder: (_, child) => auxiliaryCubit.selectedLayout(child),
    ).animate().fadeIn(
          duration: 1500.ms,
        );
  }
}
