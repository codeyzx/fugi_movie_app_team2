import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team2/src/features/home/presentation/home_controller.dart';
import 'package:logger/logger.dart';

import '../../../core/client/dio_client.dart';

class SearchMovieController extends StateNotifier<AsyncValue<List<Map<String, dynamic>>?>> {
  Reader read;
  SearchMovieController({
    required this.read,
  }) : super(const AsyncValue.data(null));

  Future<void> search(String? query) async {
    state = const AsyncValue.loading();
    try {
      var resp = await DioClient().apiCall(
        url: '/search/movie?',
        requestType: RequestType.get,
        queryParameters: {
          'query': query,
          'include_adult': false,
        },
      );
      List<Map<String, dynamic>> results = [];
      List<dynamic> listTrending = resp.data['results'];
      Logger().wtf(listTrending);
      for (var i = 0; i < listTrending.length; i++) {
        results.add(listTrending[i]);
        read(homeController.notifier).add('search', listTrending[i]['id']);
      }
      state = AsyncValue.data(results);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}

final searchControllerProvider =
    StateNotifierProvider.autoDispose<SearchMovieController, AsyncValue<List<Map<String, dynamic>>?>>(
  (ref) {
    return SearchMovieController(
      read: ref.read,
    );
  },
);
