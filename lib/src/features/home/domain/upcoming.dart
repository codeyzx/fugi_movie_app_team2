// To parse this JSON data, do
//
//     final Upcoming = UpcomingFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'upcoming.freezed.dart';
part 'upcoming.g.dart';

@freezed
abstract class Dates with _$Dates {
  const factory Dates({
    @JsonKey(name: 'maximum') DateTime? maximum,
    @JsonKey(name: 'minimum') DateTime? minimum,
  }) = _Dates;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}

@freezed
abstract class Upcoming with _$Upcoming {
  const factory Upcoming({
    @JsonKey(name: 'adult') bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_id') List<int>? genreIds,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_tile') String? originalTitle,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') DateTime? releaseDate,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'video') bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _Upcoming;

  factory Upcoming.fromJson(Map<String, dynamic> json) =>
      _$UpcomingFromJson(json);
}
