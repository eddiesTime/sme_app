import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'weather_source.freezed.dart';
part 'weather_source.g.dart';

@freezed
abstract class WeatherSource with _$WeatherSource {
  const factory WeatherSource(
      {int crawlRate, String title, String slug, String url}) = _WeatherSource;
  factory WeatherSource.fromJson(Map<String, dynamic> json) =>
      _$WeatherSourceFromJson(json);
}