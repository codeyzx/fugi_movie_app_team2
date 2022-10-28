// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'upcoming_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpcomingModel _$UpcomingModelFromJson(Map<String, dynamic> json) {
  return _UpcomingModel.fromJson(json);
}

/// @nodoc
mixin _$UpcomingModel {
  int? get page => throw _privateConstructorUsedError;
  List<Upcoming>? get results => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpcomingModelCopyWith<UpcomingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpcomingModelCopyWith<$Res> {
  factory $UpcomingModelCopyWith(
          UpcomingModel value, $Res Function(UpcomingModel) then) =
      _$UpcomingModelCopyWithImpl<$Res>;
  $Res call(
      {int? page, List<Upcoming>? results, int? totalPages, int? totalResults});
}

/// @nodoc
class _$UpcomingModelCopyWithImpl<$Res>
    implements $UpcomingModelCopyWith<$Res> {
  _$UpcomingModelCopyWithImpl(this._value, this._then);

  final UpcomingModel _value;
  // ignore: unused_field
  final $Res Function(UpcomingModel) _then;

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
              as List<Upcoming>?,
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
abstract class _$$_UpcomingModelCopyWith<$Res>
    implements $UpcomingModelCopyWith<$Res> {
  factory _$$_UpcomingModelCopyWith(
          _$_UpcomingModel value, $Res Function(_$_UpcomingModel) then) =
      __$$_UpcomingModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? page, List<Upcoming>? results, int? totalPages, int? totalResults});
}

/// @nodoc
class __$$_UpcomingModelCopyWithImpl<$Res>
    extends _$UpcomingModelCopyWithImpl<$Res>
    implements _$$_UpcomingModelCopyWith<$Res> {
  __$$_UpcomingModelCopyWithImpl(
      _$_UpcomingModel _value, $Res Function(_$_UpcomingModel) _then)
      : super(_value, (v) => _then(v as _$_UpcomingModel));

  @override
  _$_UpcomingModel get _value => super._value as _$_UpcomingModel;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_$_UpcomingModel(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Upcoming>?,
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
class _$_UpcomingModel implements _UpcomingModel {
  const _$_UpcomingModel(
      {this.page,
      final List<Upcoming>? results,
      this.totalPages,
      this.totalResults})
      : _results = results;

  factory _$_UpcomingModel.fromJson(Map<String, dynamic> json) =>
      _$$_UpcomingModelFromJson(json);

  @override
  final int? page;
  final List<Upcoming>? _results;
  @override
  List<Upcoming>? get results {
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
    return 'UpcomingModel(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpcomingModel &&
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
  _$$_UpcomingModelCopyWith<_$_UpcomingModel> get copyWith =>
      __$$_UpcomingModelCopyWithImpl<_$_UpcomingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpcomingModelToJson(
      this,
    );
  }
}

abstract class _UpcomingModel implements UpcomingModel {
  const factory _UpcomingModel(
      {final int? page,
      final List<Upcoming>? results,
      final int? totalPages,
      final int? totalResults}) = _$_UpcomingModel;

  factory _UpcomingModel.fromJson(Map<String, dynamic> json) =
      _$_UpcomingModel.fromJson;

  @override
  int? get page;
  @override
  List<Upcoming>? get results;
  @override
  int? get totalPages;
  @override
  int? get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$_UpcomingModelCopyWith<_$_UpcomingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
