import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../enum_weather_conditions.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
abstract class Weather implements _$Weather {
  const Weather._();
  const factory Weather(
      {@JsonKey(name: 'weather_state_abbr') String condition,
      @JsonKey(name: 'weather_state_name') String formattedCondition,
      String windDirectionCompass,
      DateTime created,
      DateTime applicableDate,
      double minTemp,
      double temp,
      double maxTemp,
      double windSpeed,
      double windDirection,
      double airPressure,
      int humidity,
      double visibility,
      int predictability}) = _Weather;
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  // WeatherCondition get weatherConditionForCondition =>
  //     _mapConditionToWeatherCondition(condition);

  WeatherCondition mapConditionToWeatherCondition(String condition) {
    WeatherCondition state;
    switch (condition) {
      case 'sn':
        state = WeatherCondition.snow;
        break;
      case 'sl':
        state = WeatherCondition.sleet;
        break;
      case 'h':
        state = WeatherCondition.hail;
        break;
      case 't':
        state = WeatherCondition.thunderstorm;
        break;
      case 'hr':
        state = WeatherCondition.heavyRain;
        break;
      case 'lr':
        state = WeatherCondition.lightRain;
        break;
      case 's':
        state = WeatherCondition.showers;
        break;
      case 'hc':
        state = WeatherCondition.heavyCloud;
        break;
      case 'lc':
        state = WeatherCondition.lightCloud;
        break;
      case 'c':
        state = WeatherCondition.clear;
        break;
      default:
        state = WeatherCondition.unknown;
    }
    return state;
  }
}
