import 'package:dio/dio.dart';

import 'endpoints.dart';
import 'interceptors/dio_interceptors.dart';

enum RequestType { get, post, put, patch, delete, postForm }

class DioClient {
  final String? baseUrl;
  DioClient({this.baseUrl}) {
    _dio = Dio(
      BaseOptions(
        // baseUrl: Endpoints.baseURL,
        baseUrl: baseUrl ?? Endpoints.baseURL,
        connectTimeout: Endpoints.connectionTimeout,
        receiveTimeout: Endpoints.receiveTimeout,
        responseType: ResponseType.json,
      ),
    )..interceptors.addAll([DioInterceptors()]);
  }

  late final Dio _dio;

  Future<Response<dynamic>> apiCall({
    required String url,
    required RequestType requestType,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, String>? header,
    RequestOptions? requestOptions,
  }) async {
    late Response result;

    switch (requestType) {
      case RequestType.get:
        {
          Options options = Options(headers: header);
          result = await _dio.get(url, queryParameters: queryParameters, options: options);
          break;
        }
      case RequestType.post:
        {
          Options options = Options(headers: header);
          result = await _dio.post(url, data: body, options: options);
          break;
        }
      case RequestType.delete:
        {
          Options options = Options(headers: header);
          result = await _dio.delete(url, data: queryParameters, options: options);
          break;
        }
      case RequestType.put:
        {
          Options options = Options(headers: header);
          result = await _dio.put(url, data: body, options: options);
          break;
        }
      case RequestType.patch:
        {
          Options options = Options(headers: header);
          result = await _dio.put(url, data: body, options: options);
          break;
        }
      case RequestType.postForm:
        break;
    }
    return result;
  }
}

// Future<Either<Failure, T>> remoteProcess<T>(Future<T> t) async {
//   try {
//     var futureCall = await t;
//     return Right(futureCall);
//   } on DioError catch (error) {
//     Logger().wtf(error
//         // 'error.message ${error.requestOptions.queryParameters.toString()}',
//         );
//     return Left(
//       GeneralFailure(
//         message: error.response?.data['message'],
//         // message: error.response?.statusMessage,
//       ),
//     );
//   } catch (error) {
//     Logger().i('--------***--------');
//     Logger().wtf((error as TypeError).stackTrace);
//     Logger().i('--------***--------');
//     Logger().wtf(error.toString, [error]);
//     return Left(GeneralFailure(message: error.toString()));
//   }
// }
