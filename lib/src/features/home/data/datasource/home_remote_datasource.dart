import 'package:fugi_movie_app_team2/src/features/home/data/model/upcoming_model.dart';

import '../../../../core/client/dio_client.dart';
import '../../../../core/client/endpoints.dart';
import '../model/trending_model.dart';

abstract class HomeRemoteDataSource {
  Future<TrendingModel> getTrending();
  Future<UpcomingModel> getUpcoming();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<TrendingModel> getTrending() async {
    final resp = await DioClient().apiCall(
      url: Endpoints.trending,
      requestType: RequestType.get,
      queryParameters: {},
    );
    return TrendingModel.fromJson(resp.data);
  }

  @override
  Future<UpcomingModel> getUpcoming() async {
    final resp = await DioClient().apiCall(
      url: Endpoints.upcoming,
      requestType: RequestType.get,
      queryParameters: {},
    );
    return UpcomingModel.fromJson(resp.data);
  }
}
