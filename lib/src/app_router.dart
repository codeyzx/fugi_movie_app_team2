import 'package:fugi_movie_app_team2/src/features/home/domain/popular.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/top_rated.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/upcoming.dart';
import 'package:fugi_movie_app_team2/src/features/home/presentation/botnavbar_screen.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_detail_screen.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_detail_screen_popular.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_detail_screen_toprated.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_detail_screen_upcoming.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_watchlist.dart';
import 'package:fugi_movie_app_team2/src/features/profile/presentation/profile_screen.dart';
import 'package:fugi_movie_app_team2/src/features/search/presentation/search_screen.dart';
import 'package:go_router/go_router.dart';

import 'features/home/presentation/home_screen.dart';
import 'features/search/presentation/search_page.dart';
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
        path: '/botnavbar-screen',
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
        path: '/search-screen',
        name: SearchScreen.routeName,
        pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const SearchScreen(),
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
        pageBuilder: (context, state) {
          // final movieId = state.extra as Trending;
          final movieId = state.extra as Map<String, dynamic>;
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: MovieDetailScreen(
              // trending: movieId,
              idAndObject: movieId,
            ),
          );
        }),
    GoRoute(
        path: '/movie-screen-popular',
        name: MovieDetailScreenPopular.routeName,
        pageBuilder: (context, state) {
          final movieId = state.extra as Popular;
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: MovieDetailScreenPopular(
              popular: movieId,
            ),
          );
        }),
    GoRoute(
        path: '/movie-screen-toprated',
        name: MovieDetailScreenTopRated.routeName,
        pageBuilder: (context, state) {
          final movieId = state.extra as TopRated;
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: MovieDetailScreenTopRated(
              topRated: movieId,
            ),
          );
        }),
    GoRoute(
        path: '/movie-screen-upcoming',
        name: MovieDetailScreenUpcoming.routeName,
        pageBuilder: (context, state) {
          final movieId = state.extra as Upcoming;
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: MovieDetailScreenUpcoming(
              upcoming: movieId,
            ),
          );
        }),
    GoRoute(
      path: '/watchlist-screen',
      name: WatchlistScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const WatchlistScreen(),
      ),
    ),
    GoRoute(
      path: '/search-page',
      name: SearchPage.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SearchPage(),
      ),
    )
  ],
);
