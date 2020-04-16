import 'package:redux_example/model/enums/enum_weather_conditions.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
abstract class Weather implements _$Weather {
  const Weather._();
  const factory Weather(
      {@JsonKey(name: 'weather_state_abbr') String condition,
      @JsonKey(name: 'weather_state_name') String formattedCondition,
      @JsonKey(name: 'wind_direction_compass') String windDirectionCompass,
      DateTime created,
      @JsonKey(name: 'applicable_date') DateTime applicableDate,
      @JsonKey(name: 'min_temp') double minTemp,
      @JsonKey(name: 'the_temp') double temp,
      @JsonKey(name: 'max_temp') double maxTemp,
      @JsonKey(name: 'wind_speed') double windSpeed,
      @JsonKey(name: 'wind_direction') double windDirection,
      @JsonKey(name: 'air_pressure') double airPressure,
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
