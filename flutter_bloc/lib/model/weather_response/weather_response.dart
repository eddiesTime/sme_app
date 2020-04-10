import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:cnp/model/models.dart';

part 'weather_response.freezed.dart';
part 'weather_response.g.dart';

@freezed
abstract class WeatherResponse with _$WeatherResponse {
  const factory WeatherResponse(
      {@JsonKey(name: 'consolidated_weather') List<Weather> weatherCollection,
      @JsonKey(name: 'sources') List<WeatherSource> weatherDataSources,
      @JsonKey(name: 'sun_rise') DateTime sunRise,
      @JsonKey(name: 'sun_set') DateTime sunSet,
      @JsonKey(name: 'woeid') int locationId,
      String title}) = _WeatherResponse;
  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
