import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
abstract class Location with _$Location {
  const factory Location(
      {String title,
      @JsonKey(name: 'location_type') String locationType,
      @JsonKey(name: 'woeid') int woeId,
      @JsonKey(name: 'latt_long') String lattLong,
      int distance}) = _Location;
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
