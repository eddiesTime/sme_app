import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

/// [Location] is a mapper class for the response of [MetaWeather](https://www.metaweather.com/).
@freezed
abstract class Location with _$Location {
  const factory Location(
      {String title,
      String locationType,
      @JsonKey(name: 'woeid') int woeId,
      String lattLong,
      int distance}) = _Location;
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
