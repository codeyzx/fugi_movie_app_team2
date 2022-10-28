// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'upcoming.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dates _$DatesFromJson(Map<String, dynamic> json) {
  return _Dates.fromJson(json);
}

/// @nodoc
mixin _$Dates {
  @JsonKey(name: 'maximum')
  DateTime? get maximum => throw _privateConstructorUsedError;
  @JsonKey(name: 'minimum')
  DateTime? get minimum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatesCopyWith<Dates> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatesCopyWith<$Res> {
  factory $DatesCopyWith(Dates value, $Res Function(Dates) then) =
      _$DatesCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'maximum') DateTime? maximum,
      @JsonKey(name: 'minimum') DateTime? minimum});
}

/// @nodoc
class _$DatesCopyWithImpl<$Res> implements $DatesCopyWith<$Res> {
  _$DatesCopyWithImpl(this._value, this._then);

  final Dates _value;
  // ignore: unused_field
  final $Res Function(Dates) _then;

  @override
  $Res call({
    Object? maximum = freezed,
    Object? minimum = freezed,
  }) {
    return _then(_value.copyWith(
      maximum: maximum == freezed
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minimum: minimum == freezed
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_DatesCopyWith<$Res> implements $DatesCopyWith<$Res> {
  factory _$$_DatesCopyWith(_$_Dates value, $Res Function(_$_Dates) then) =
      __$$_DatesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'maximum') DateTime? maximum,
      @JsonKey(name: 'minimum') DateTime? minimum});
}

/// @nodoc
class __$$_DatesCopyWithImpl<$Res> extends _$DatesCopyWithImpl<$Res>
    implements _$$_DatesCopyWith<$Res> {
  __$$_DatesCopyWithImpl(_$_Dates _value, $Res Function(_$_Dates) _then)
      : super(_value, (v) => _then(v as _$_Dates));

  @override
  _$_Dates get _value => super._value as _$_Dates;

  @override
  $Res call({
    Object? maximum = freezed,
    Object? minimum = freezed,
  }) {
    return _then(_$_Dates(
      maximum: maximum == freezed
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minimum: minimum == freezed
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dates implements _Dates {
  const _$_Dates(
      {@JsonKey(name: 'maximum') this.maximum,
      @JsonKey(name: 'minimum') this.minimum});

  factory _$_Dates.fromJson(Map<String, dynamic> json) =>
      _$$_DatesFromJson(json);

  @override
  @JsonKey(name: 'maximum')
  final DateTime? maximum;
  @override
  @JsonKey(name: 'minimum')
  final DateTime? minimum;

  @override
  String toString() {
    return 'Dates(maximum: $maximum, minimum: $minimum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dates &&
            const DeepCollectionEquality().equals(other.maximum, maximum) &&
            const DeepCollectionEquality().equals(other.minimum, minimum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(maximum),
      const DeepCollectionEquality().hash(minimum));

  @JsonKey(ignore: true)
  @override
  _$$_DatesCopyWith<_$_Dates> get copyWith =>
      __$$_DatesCopyWithImpl<_$_Dates>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DatesToJson(
      this,
    );
  }
}

abstract class _Dates implements Dates {
  const factory _Dates(
      {@JsonKey(name: 'maximum') final DateTime? maximum,
      @JsonKey(name: 'minimum') final DateTime? minimum}) = _$_Dates;

  factory _Dates.fromJson(Map<String, dynamic> json) = _$_Dates.fromJson;

  @override
  @JsonKey(name: 'maximum')
  DateTime? get maximum;
  @override
  @JsonKey(name: 'minimum')
  DateTime? get minimum;
  @override
  @JsonKey(ignore: true)
  _$$_DatesCopyWith<_$_Dates> get copyWith =>
      throw _privateConstructorUsedError;
}

Upcoming _$UpcomingFromJson(Map<String, dynamic> json) {
  return _Upcoming.fromJson(json);
}

/// @nodoc
mixin _$Upcoming {
  @JsonKey(name: 'adult')
  bool? get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'genre_id')
  List<int>? get genreIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String? get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_tile')
  String? get originalTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'overview')
  String? get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'popularity')
  double? get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  DateTime? get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'video')
  bool? get video => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int? get voteCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpcomingCopyWith<Upcoming> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpcomingCopyWith<$Res> {
  factory $UpcomingCopyWith(Upcoming value, $Res Function(Upcoming) then) =
      _$UpcomingCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'adult') bool? adult,
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
      @JsonKey(name: 'vote_count') int? voteCount});
}

/// @nodoc
class _$UpcomingCopyWithImpl<$Res> implements $UpcomingCopyWith<$Res> {
  _$UpcomingCopyWithImpl(this._value, this._then);

  final Upcoming _value;
  // ignore: unused_field
  final $Res Function(Upcoming) _then;

  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? id = freezed,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? title = freezed,
    Object? video = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
  }) {
    return _then(_value.copyWith(
      adult: adult == freezed
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: genreIds == freezed
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      originalLanguage: originalLanguage == freezed
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: originalTitle == freezed
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: popularity == freezed
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool?,
      voteAverage: voteAverage == freezed
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: voteCount == freezed
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_UpcomingCopyWith<$Res> implements $UpcomingCopyWith<$Res> {
  factory _$$_UpcomingCopyWith(
          _$_Upcoming value, $Res Function(_$_Upcoming) then) =
      __$$_UpcomingCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'adult') bool? adult,
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
      @JsonKey(name: 'vote_count') int? voteCount});
}

/// @nodoc
class __$$_UpcomingCopyWithImpl<$Res> extends _$UpcomingCopyWithImpl<$Res>
    implements _$$_UpcomingCopyWith<$Res> {
  __$$_UpcomingCopyWithImpl(
      _$_Upcoming _value, $Res Function(_$_Upcoming) _then)
      : super(_value, (v) => _then(v as _$_Upcoming));

  @override
  _$_Upcoming get _value => super._value as _$_Upcoming;

  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? id = freezed,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? title = freezed,
    Object? video = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
  }) {
    return _then(_$_Upcoming(
      adult: adult == freezed
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: genreIds == freezed
          ? _value._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      originalLanguage: originalLanguage == freezed
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: originalTitle == freezed
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: popularity == freezed
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool?,
      voteAverage: voteAverage == freezed
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: voteCount == freezed
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Upcoming implements _Upcoming {
  const _$_Upcoming(
      {@JsonKey(name: 'adult') this.adult,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'genre_id') final List<int>? genreIds,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'original_language') this.originalLanguage,
      @JsonKey(name: 'original_tile') this.originalTitle,
      @JsonKey(name: 'overview') this.overview,
      @JsonKey(name: 'popularity') this.popularity,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'release_date') this.releaseDate,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'video') this.video,
      @JsonKey(name: 'vote_average') this.voteAverage,
      @JsonKey(name: 'vote_count') this.voteCount})
      : _genreIds = genreIds;

  factory _$_Upcoming.fromJson(Map<String, dynamic> json) =>
      _$$_UpcomingFromJson(json);

  @override
  @JsonKey(name: 'adult')
  final bool? adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final List<int>? _genreIds;
  @override
  @JsonKey(name: 'genre_id')
  List<int>? get genreIds {
    final value = _genreIds;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @override
  @JsonKey(name: 'original_tile')
  final String? originalTitle;
  @override
  @JsonKey(name: 'overview')
  final String? overview;
  @override
  @JsonKey(name: 'popularity')
  final double? popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'release_date')
  final DateTime? releaseDate;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'video')
  final bool? video;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  @override
  String toString() {
    return 'Upcoming(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Upcoming &&
            const DeepCollectionEquality().equals(other.adult, adult) &&
            const DeepCollectionEquality()
                .equals(other.backdropPath, backdropPath) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.originalLanguage, originalLanguage) &&
            const DeepCollectionEquality()
                .equals(other.originalTitle, originalTitle) &&
            const DeepCollectionEquality().equals(other.overview, overview) &&
            const DeepCollectionEquality()
                .equals(other.popularity, popularity) &&
            const DeepCollectionEquality()
                .equals(other.posterPath, posterPath) &&
            const DeepCollectionEquality()
                .equals(other.releaseDate, releaseDate) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.video, video) &&
            const DeepCollectionEquality()
                .equals(other.voteAverage, voteAverage) &&
            const DeepCollectionEquality().equals(other.voteCount, voteCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(adult),
      const DeepCollectionEquality().hash(backdropPath),
      const DeepCollectionEquality().hash(_genreIds),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(originalLanguage),
      const DeepCollectionEquality().hash(originalTitle),
      const DeepCollectionEquality().hash(overview),
      const DeepCollectionEquality().hash(popularity),
      const DeepCollectionEquality().hash(posterPath),
      const DeepCollectionEquality().hash(releaseDate),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(video),
      const DeepCollectionEquality().hash(voteAverage),
      const DeepCollectionEquality().hash(voteCount));

  @JsonKey(ignore: true)
  @override
  _$$_UpcomingCopyWith<_$_Upcoming> get copyWith =>
      __$$_UpcomingCopyWithImpl<_$_Upcoming>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpcomingToJson(
      this,
    );
  }
}

abstract class _Upcoming implements Upcoming {
  const factory _Upcoming(
      {@JsonKey(name: 'adult') final bool? adult,
      @JsonKey(name: 'backdrop_path') final String? backdropPath,
      @JsonKey(name: 'genre_id') final List<int>? genreIds,
      @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'original_language') final String? originalLanguage,
      @JsonKey(name: 'original_tile') final String? originalTitle,
      @JsonKey(name: 'overview') final String? overview,
      @JsonKey(name: 'popularity') final double? popularity,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'release_date') final DateTime? releaseDate,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'video') final bool? video,
      @JsonKey(name: 'vote_average') final double? voteAverage,
      @JsonKey(name: 'vote_count') final int? voteCount}) = _$_Upcoming;

  factory _Upcoming.fromJson(Map<String, dynamic> json) = _$_Upcoming.fromJson;

  @override
  @JsonKey(name: 'adult')
  bool? get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'genre_id')
  List<int>? get genreIds;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'original_language')
  String? get originalLanguage;
  @override
  @JsonKey(name: 'original_tile')
  String? get originalTitle;
  @override
  @JsonKey(name: 'overview')
  String? get overview;
  @override
  @JsonKey(name: 'popularity')
  double? get popularity;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'release_date')
  DateTime? get releaseDate;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'video')
  bool? get video;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int? get voteCount;
  @override
  @JsonKey(ignore: true)
  _$$_UpcomingCopyWith<_$_Upcoming> get copyWith =>
      throw _privateConstructorUsedError;
}
