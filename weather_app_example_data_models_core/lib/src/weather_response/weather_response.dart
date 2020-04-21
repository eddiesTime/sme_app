import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app_example_data_models_core/src/weather/weather.dart';
import 'package:weather_app_example_data_models_core/src/weather_source/weather_source.dart';

part 'weather_response.freezed.dart';
part 'weather_response.g.dart';

@freezed
abstract class WeatherResponse with _$WeatherResponse {
  const factory WeatherResponse(
      {@JsonKey(name: 'consolidated_weather') List<Weather> weatherCollection,
      @JsonKey(name: 'sources') List<WeatherSource> weatherDataSources,
      DateTime sunRise,
      DateTime sunSet,
      @JsonKey(name: 'woeid') int locationId,
      String title}) = _WeatherResponse;
  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
