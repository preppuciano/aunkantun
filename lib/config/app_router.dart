import 'package:aukantun/core/play_game/models/play_game_model.dart';
import 'package:aukantun/views/attributions_view.dart';
import 'package:aukantun/views/game_view.dart';
import 'package:aukantun/views/games_view.dart';
import 'package:aukantun/views/home/home_view.dart';
import 'package:aukantun/views/play_game/play_game_view.dart';
import 'package:aukantun/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static AppRouter? _instance;

  factory AppRouter() {
    if (_instance != null) {
      return _instance!;
    } else {
      return _instance = AppRouter._();
    }
  }

  AppRouter._();

  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) {
          return const SettingsView();
        },
      ),
      GoRoute(
        path: '/attributions',
        builder: (context, state) {
          return const AttributionsView();
        },
      ),
      GoRoute(
        name: 'games_view',
        path: '/games',
        builder: (context, state) => const GamesView(),
        routes: <RouteBase>[
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final id = state.pathParameters["id"];
              if (id != null) {
                return GameView(gameId: id);
              } else {
                return Text('ERROR');
              }
            },
          ),
        ],
      ),
      GoRoute(
        path: '/play',
        builder: (context, state) {
          final playGame = state.extra as PlayGameModel;
          try {
            return PlayGameView(playGame: playGame);
          } catch (err) {
            return Text('ERROR');
          }
        },
      ),
    ],
  );
}
