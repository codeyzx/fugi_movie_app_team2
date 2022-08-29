// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail.freezed.dart';
part 'movie_detail.g.dart';

@freezed
abstract class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    @JsonKey(name: 'adult') bool? adult,
    @JsonKey(name: 'backdrop_path') dynamic backdropPath,
    @JsonKey(name: 'belongs_to_collection') dynamic belongsToCollection,
    @JsonKey(name: 'budget') int? budget,
    @JsonKey(name: 'genres') List<Genre>? genres,
    @JsonKey(name: 'homepage') String? homepage,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'imdb_id') dynamic imdbId,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'production_companies') List<ProductionCompany>? productionCompanies,
    @JsonKey(name: 'production_countries') List<dynamic>? productionCountries,
    @JsonKey(name: 'release_date') dynamic releaseDate,
    @JsonKey(name: 'revenue') int? revenue,
    @JsonKey(name: 'runtime') int? runtime,
    @JsonKey(name: 'spoken_languages') List<dynamic>? spokenLanguages,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'tagline') String? tagline,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'video') bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _MovieDetail;

  factory MovieDetail.fromJson(Map<String, dynamic> json) => _$MovieDetailFromJson(json);
}

@freezed
abstract class Genre with _$Genre {
  const factory Genre({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
abstract class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    @JsonKey(name: 'idd') int? id,
    @JsonKey(name: 'logo_path') dynamic logoPath,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'origin_country') String? originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);
}

//
