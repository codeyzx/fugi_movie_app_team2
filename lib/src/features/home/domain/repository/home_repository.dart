import 'package:fpdart/fpdart.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/entities/upcoming.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/client/failure.dart';
import '../../data/repository/home_repository_impl.dart';
import '../entities/trending.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Trending>?>> getTrending();
  Future<Either<Failure, List<Upcoming>?>> getUpcoming();
}

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) => HomeRepositoryImpl(),
);
