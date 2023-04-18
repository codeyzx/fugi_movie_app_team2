import 'dart:async';

import 'package:fugi_movie_app_team2/src/features/home/domain/entities/trending.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/entities/upcoming.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/repository/home_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

class HomeController extends StateNotifier<List<Map<String, dynamic>?>> {
  HomeController() : super([]) {
    getData();
  }

  List<Map<String, dynamic>?> getData() {
    Logger().wtf(state);
    return state;
  }

  //category: toprated, popular
  void add(String category, dynamic value) {
    var myState = [...state];
    var findIndex = myState.indexWhere(
      (element) => element!['category'] == category && element['value'] == value,
    );
    if (findIndex == -1) {
      myState.add({
        'category': category,
        'value': value,
      });
    }
    state = myState;
  }
}

final homeController = StateNotifierProvider<HomeController, List<Map<String, dynamic>?>>(
  (ref) => HomeController(),
);

final listOfMovieProvider = StateProvider<List<dynamic>?>(
  (ref) {
    return [];
  },
);

class FetchMovieController extends StateNotifier<AsyncValue<List<dynamic>?>> {
  FetchMovieController() : super(const AsyncValue.loading());
}

@riverpod
class TopRatedController extends _$TopRatedController {
  @override
  FutureOr<List<Trending>?> build() async {
    final resp = await ref.read(homeRepositoryProvider).getTopRated();
    return resp.fold(
      (l) => null,
      (r) => r,
    );
  }
}

class TrendingController extends StateNotifier<AsyncValue<List<Trending>?>> {
  final HomeRepository repository;
  TrendingController({
    required this.repository,
  }) : super(const AsyncValue.loading()) {
    getTrending();
  }

  Future<void> getTrending() async {
    state = const AsyncValue.loading();
    final resp = await repository.getTrending();
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

final trendingControllerProvider = StateNotifierProvider<TrendingController, AsyncValue<List<Trending>?>>(
  (ref) => TrendingController(
    repository: ref.watch(homeRepositoryProvider),
  ),
);

class UpcomingController extends StateNotifier<AsyncValue<List<Upcoming>?>> {
  final HomeRepository repository;
  UpcomingController({
    required this.repository,
  }) : super(const AsyncValue.loading()) {
    getUpcoming();
  }

  Future<void> getUpcoming() async {
    state = const AsyncValue.loading();
    final resp = await repository.getUpcoming();
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

final upcomingControllerProvider = StateNotifierProvider<UpcomingController, AsyncValue<List<Upcoming>?>>(
  (ref) => UpcomingController(
    repository: ref.watch(homeRepositoryProvider),
  ),
);
