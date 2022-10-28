import 'package:dartz/dartz.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/entities/trending.dart';

import '../../../../core/client/dio_client.dart';
import '../../../../core/client/failure.dart';
import '../../domain/repository/home_repository.dart';
import '../datasource/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final remoteDataSource = HomeRemoteDataSourceImpl();

  @override
  Future<Either<Failure, List<Trending>?>> getTrending() async {
    final resp = await remoteProcess(
      remoteDataSource.getTrending(),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.results),
    );
  }
}