import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/entities/popular.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/entities/top_rated.dart';

import '../../domain/entities/trending.dart';

part 'trending_model.freezed.dart';
part 'trending_model.g.dart';

@freezed
abstract class TrendingModel with _$TrendingModel {
  const factory TrendingModel({
    int? page,
    List<Trending>? results,
    int? totalPages,
    int? totalResults,
  }) = _TrendingModel;

  factory TrendingModel.fromJson(Map<String, dynamic> json) => _$TrendingModelFromJson(json);
}

@freezed
abstract class TopRatedModel with _$TopRatedModel {
  const factory TopRatedModel({
    int? page,
    List<TopRated>? results,
    int? totalPages,
    int? totalResults,
  }) = _TopRatedModel;

  factory TopRatedModel.fromJson(Map<String, dynamic> json) => _$TopRatedModelFromJson(json);
}

@freezed
abstract class PopularModel with _$PopularModel {
  const factory PopularModel({
    int? page,
    List<Popular>? results,
    int? totalPages,
    int? totalResults,
  }) = _PopularModel;

  factory PopularModel.fromJson(Map<String, dynamic> json) => _$PopularModelFromJson(json);
}
