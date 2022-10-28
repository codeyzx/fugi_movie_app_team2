// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'trending_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrendingModel _$$_TrendingModelFromJson(Map<String, dynamic> json) => _$_TrendingModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)?.map((e) => Trending.fromJson(e as Map<String, dynamic>)).toList(),
      totalPages: json['totalPages'] as int?,
      totalResults: json['totalResults'] as int?,
    );

Map<String, dynamic> _$$_TrendingModelToJson(_$_TrendingModel instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
