// To parse this JSON data, do
//
//     final popular = popularFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular.freezed.dart';
part 'popular.g.dart';

@freezed
abstract class Popular with _$Popular {
  const factory Popular({
    @JsonKey(name: 'adult') bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'orignal_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') DateTime? releaseDate,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'video') bool? video,
    @JsonKey(name: 'vote_avarage') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _Popular;

  factory Popular.fromJson(Map<String, dynamic> json) => _$PopularFromJson(json);
}
