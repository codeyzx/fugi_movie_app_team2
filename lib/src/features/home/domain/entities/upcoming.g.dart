// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Dates _$$_DatesFromJson(Map<String, dynamic> json) => _$_Dates(
      maximum: json['maximum'] == null
          ? null
          : DateTime.parse(json['maximum'] as String),
      minimum: json['minimum'] == null
          ? null
          : DateTime.parse(json['minimum'] as String),
    );

Map<String, dynamic> _$$_DatesToJson(_$_Dates instance) => <String, dynamic>{
      'maximum': instance.maximum?.toIso8601String(),
      'minimum': instance.minimum?.toIso8601String(),
    };

_$_Upcoming _$$_UpcomingFromJson(Map<String, dynamic> json) => _$_Upcoming(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_id'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_tile'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );

Map<String, dynamic> _$$_UpcomingToJson(_$_Upcoming instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_id': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_tile': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate?.toIso8601String(),
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
