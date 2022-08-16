import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_screen.dart';
import 'splash_screen.dart';

final goRouter = GoRouter(initialLocation: '/', debugLogDiagnostics: true, routes: [
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
]);
