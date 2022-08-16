import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team2/src/detailscreen.dart';
import 'package:go_router/go_router.dart';

import 'homescreen.dart';
import 'splash_screen.dart';

final goRouter =
    GoRouter(initialLocation: '/', debugLogDiagnostics: true, routes: [
  GoRoute(
    path: '/',
    name: SplashScreen.routeName,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const SplashScreen(),
    ),
  ),
  GoRoute(
    path: '/home-screen',
    name: HomeScreen.routeName,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const HomeScreen(),
    ),
  ),
  GoRoute(
    path: '/detail-screen',
    name: DetailScreen.routeName,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const DetailScreen(),
    ),
  ),
]);
