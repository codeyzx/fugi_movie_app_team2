import 'package:freezed_annotation/freezed_annotation.dart';

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
