// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trending_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrendingModel _$TrendingModelFromJson(Map<String, dynamic> json) {
  return _TrendingModel.fromJson(json);
}

/// @nodoc
mixin _$TrendingModel {
  int? get page => throw _privateConstructorUsedError;
  List<Trending>? get results => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrendingModelCopyWith<TrendingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingModelCopyWith<$Res> {
  factory $TrendingModelCopyWith(
          TrendingModel value, $Res Function(TrendingModel) then) =
      _$TrendingModelCopyWithImpl<$Res>;
  $Res call(
      {int? page, List<Trending>? results, int? totalPages, int? totalResults});
}

/// @nodoc
class _$TrendingModelCopyWithImpl<$Res>
    implements $TrendingModelCopyWith<$Res> {
  _$TrendingModelCopyWithImpl(this._value, this._then);

  final TrendingModel _value;
  // ignore: unused_field
  final $Res Function(TrendingModel) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Trending>?,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_TrendingModelCopyWith<$Res>
    implements $TrendingModelCopyWith<$Res> {
  factory _$$_TrendingModelCopyWith(
          _$_TrendingModel value, $Res Function(_$_TrendingModel) then) =
      __$$_TrendingModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? page, List<Trending>? results, int? totalPages, int? totalResults});
}

/// @nodoc
class __$$_TrendingModelCopyWithImpl<$Res>
    extends _$TrendingModelCopyWithImpl<$Res>
    implements _$$_TrendingModelCopyWith<$Res> {
  __$$_TrendingModelCopyWithImpl(
      _$_TrendingModel _value, $Res Function(_$_TrendingModel) _then)
      : super(_value, (v) => _then(v as _$_TrendingModel));

  @override
  _$_TrendingModel get _value => super._value as _$_TrendingModel;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_$_TrendingModel(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Trending>?,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TrendingModel implements _TrendingModel {
  const _$_TrendingModel(
      {this.page,
      final List<Trending>? results,
      this.totalPages,
      this.totalResults})
      : _results = results;

  factory _$_TrendingModel.fromJson(Map<String, dynamic> json) =>
      _$$_TrendingModelFromJson(json);

  @override
  final int? page;
  final List<Trending>? _results;
  @override
  List<Trending>? get results {
    final value = _results;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalPages;
  @override
  final int? totalResults;

  @override
  String toString() {
    return 'TrendingModel(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrendingModel &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            const DeepCollectionEquality()
                .equals(other.totalPages, totalPages) &&
            const DeepCollectionEquality()
                .equals(other.totalResults, totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(_results),
      const DeepCollectionEquality().hash(totalPages),
      const DeepCollectionEquality().hash(totalResults));

  @JsonKey(ignore: true)
  @override
  _$$_TrendingModelCopyWith<_$_TrendingModel> get copyWith =>
      __$$_TrendingModelCopyWithImpl<_$_TrendingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrendingModelToJson(
      this,
    );
  }
}

abstract class _TrendingModel implements TrendingModel {
  const factory _TrendingModel(
      {final int? page,
      final List<Trending>? results,
      final int? totalPages,
      final int? totalResults}) = _$_TrendingModel;

  factory _TrendingModel.fromJson(Map<String, dynamic> json) =
      _$_TrendingModel.fromJson;

  @override
  int? get page;
  @override
  List<Trending>? get results;
  @override
  int? get totalPages;
  @override
  int? get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$_TrendingModelCopyWith<_$_TrendingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
