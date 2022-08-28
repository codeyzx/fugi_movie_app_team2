// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_movie.freezed.dart';
part 'latest_movie.g.dart';

@freezed
abstract class LatestMovie with _$LatestMovie {
  const factory LatestMovie({
    @JsonKey(name: 'adult') bool? adult,
    @JsonKey(name: 'backdrop_path') dynamic backdropPath,
    @JsonKey(name: 'belongs_to_collection') dynamic belongsToCollection,
    @JsonKey(name: 'budget') int? budget,
    @JsonKey(name: 'genres') List<dynamic>? genres,
    @JsonKey(name: 'homepage') String? homepage,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'imdb_id') dynamic imdbId,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'popularity') int? popularity,
    @JsonKey(name: 'poster_path') dynamic posterPath,
    @JsonKey(name: 'production_companies') List<dynamic>? productionCompanies,
    @JsonKey(name: 'production_countries') List<dynamic>? productionCountries,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'revenue') int? revenue,
    @JsonKey(name: 'runtime') int? runtime,
    @JsonKey(name: 'spoken_languages') List<dynamic>? spokenLanguages,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'tagline') String? tagline,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'video') bool? video,
    @JsonKey(name: 'vote_average') int? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _LatestMovie;

  factory LatestMovie.fromJson(Map<String, dynamic> json) => _$LatestMovieFromJson(json);
}
