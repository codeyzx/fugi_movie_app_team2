// To parse this JSON data, do
//
//     final trending = trendingFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending.freezed.dart';
part 'trending.g.dart';

@freezed
abstract class Trending with _$Trending {
  const factory Trending({
    @JsonKey(name: 'adult') bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_name') String? originalName,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'media_type') String? mediaType,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'first_air_date') DateTime? firstAirDate,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'origin_country') List<String>? originCountry,
  }) = _Trending;

  factory Trending.fromJson(Map<String, dynamic> json) => _$TrendingFromJson(json);
}
