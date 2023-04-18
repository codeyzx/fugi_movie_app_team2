import 'package:fpdart/fpdart.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/entities/top_rated.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/entities/upcoming.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/client/failure.dart';
import '../../data/repository/home_repository_impl.dart';
import '../entities/popular.dart';
import '../entities/trending.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Trending>?>> getTrending();
  Future<Either<Failure, List<Upcoming>?>> getUpcoming();
  Future<Either<Failure, List<TopRated>?>> getTopRated();
  Future<Either<Failure, List<Popular>?>> getPopular();
}

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) => HomeRepositoryImpl(),
);
