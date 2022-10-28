import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/client/failure.dart';
import '../../data/repository/home_repository_impl.dart';
import '../entities/trending.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Trending>?>> getTrending();
}

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) => HomeRepositoryImpl(),
);