import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../core/client/dio_client.dart';

class SearchMovieController extends StateNotifier<AsyncValue<List<Map<String, dynamic>>?>> {
  SearchMovieController() : super(const AsyncValue.loading());

  Future<void> search(String query) async {
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
      }
      state = AsyncValue.data(results);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}

final searchControllerProvider = StateNotifierProvider<SearchMovieController, AsyncValue<List<Map<String, dynamic>>?>>(
  (ref) {
    return SearchMovieController();
  },
);
