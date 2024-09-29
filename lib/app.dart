import 'package:aukantun/config/app_localizations.dart';
import 'package:aukantun/config/app_router.dart';
import 'package:aukantun/config/app_theme.dart';
import 'package:aukantun/core/database/database_bloc.dart';
import 'package:aukantun/core/game_list/game_list_bloc.dart';
import 'package:aukantun/core/getting_started/bloc/getting_started_bloc.dart';
import 'package:aukantun/core/play_game/play_game_bloc.dart';
import 'package:aukantun/services/audio_service.dart';
import 'package:aukantun/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

extension GoRouterExtension on GoRouter {
  String location() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    return location;
  }
}

class App extends StatelessWidget {
  final AppRouter appRouter;
  App({super.key}) : appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    DatabaseService databaseService = DatabaseService();
    PlayGameBloc playGameBloc = PlayGameBloc();

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AudioService())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  GameListBloc(databaseService: databaseService)),
          BlocProvider(
              create: (context) =>
                  DatabaseBloc(databaseService: databaseService)),
          BlocProvider(create: (context) => GettingStartedBloc()),
          BlocProvider(create: (context) => playGameBloc),
        ],
        child: MaterialApp.router(
          // Agrega el soporte de localización
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // Inglés
            Locale('es', ''), // Español
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            // Selecciona el idioma del dispositivo si está soportado
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            // Si no está soportado, usa el idioma por defecto
            return supportedLocales.first;
          },
          theme: AppTheme(),
          routerConfig: appRouter.router,
        ),
      ),
    );
  }
}
