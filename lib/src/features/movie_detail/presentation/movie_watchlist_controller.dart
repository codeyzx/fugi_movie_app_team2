import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/movie_detail.dart';

class MovieWatchlistController extends StateNotifier<List<MovieDetail>?> {
  MovieWatchlistController() : super([]);

  bool isWishlist(MovieDetail movie) {
    var myState = [...?state];
    return myState.contains(movie);
  }

  void addToWatchlist(MovieDetail trending) {
    var myState = [...?state];
    var index = myState.indexWhere((element) => element.id == trending.id);
    if (index == -1) {
      myState.add(trending);
    }
    state = myState;
  }

  void removeFromWatchlist(MovieDetail trending) {
    var myState = [...?state];
    var index = myState.indexWhere((element) => element.id == trending.id);
    if (index != -1) {
      myState.removeAt(index);
    }
    state = myState;
  }
}

final watchlistControllerProvider = StateNotifierProvider<MovieWatchlistController, List<MovieDetail>?>(
  (ref) => MovieWatchlistController(),
);
