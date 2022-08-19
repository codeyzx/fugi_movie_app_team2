import 'package:fugi_movie_app_team2/src/features/home/presentation/botnavbar_screen.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_detail_screen.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_watchlist.dart';
import 'package:fugi_movie_app_team2/src/features/profile/presentation/profile_screen.dart';
import 'package:go_router/go_router.dart';

import 'features/home/presentation/home_screen.dart';
import 'features/starter/presentation/splash_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
        path: '/navbar-widget',
        name: BotNavBarScreen.routeName,
        pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const BotNavBarScreen(),
            ),
        routes: []),
    GoRoute(
        path: '/home-screen',
        name: HomeScreen.routeName,
        pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const HomeScreen(),
            ),
        routes: []),
    GoRoute(
        path: '/profile-screen',
        name: ProfileScreen.routeName,
        pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const ProfileScreen(),
            ),
        routes: []),
    GoRoute(
      path: '/movie-screen',
      name: MovieDetailScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const MovieDetailScreen(),
      ),
    ),
    GoRoute(
      path: '/watchlist-screen',
      name: WatchlistScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const WatchlistScreen(),
      ),
    ),
  ],
);
