// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LatestMovie _$$_LatestMovieFromJson(Map<String, dynamic> json) =>
    _$_LatestMovie(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'],
      budget: json['budget'] as int?,
      genres: json['genres'] as List<dynamic>?,
      homepage: json['homepage'] as String?,
      id: json['id'] as int?,
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: json['popularity'] as int?,
      posterPath: json['poster_path'],
      productionCompanies: json['production_companies'] as List<dynamic>?,
      productionCountries: json['production_countries'] as List<dynamic>?,
      releaseDate: json['release_date'] as String?,
      revenue: json['revenue'] as int?,
      runtime: json['runtime'] as int?,
      spokenLanguages: json['spoken_languages'] as List<dynamic>?,
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: json['vote_average'] as int?,
      voteCount: json['vote_count'] as int?,
    );

Map<String, dynamic> _$$_LatestMovieToJson(_$_LatestMovie instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
