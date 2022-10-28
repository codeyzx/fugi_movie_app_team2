import '../../../../core/client/dio_client.dart';
import '../../../../core/client/endpoints.dart';
import '../model/trending_model.dart';

abstract class HomeRemoteDataSource {
  Future<TrendingModel> getTrending();
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
}
