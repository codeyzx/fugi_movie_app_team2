import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/upcoming.dart';

part 'upcoming_model.freezed.dart';
part 'upcoming_model.g.dart';

@freezed
abstract class UpcomingModel with _$UpcomingModel {
  const factory UpcomingModel({
    int? page,
    List<Upcoming>? results,
    int? totalPages,
    int? totalResults,
  }) = _UpcomingModel;

  factory UpcomingModel.fromJson(Map<String, dynamic> json) => _$UpcomingModelFromJson(json);
}
