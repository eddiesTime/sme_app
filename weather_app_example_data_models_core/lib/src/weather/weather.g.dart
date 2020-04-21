// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$_$_WeatherFromJson(Map<String, dynamic> json) {
  return _$_Weather(
    condition: json['weather_state_abbr'] as String,
    formattedCondition: json['weather_state_name'] as String,
    windDirectionCompass: json['wind_direction_compass'] as String,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    applicableDate: json['applicable_date'] == null
        ? null
        : DateTime.parse(json['applicable_date'] as String),
    minTemp: (json['min_temp'] as num)?.toDouble(),
    temp: (json['temp'] as num)?.toDouble(),
    maxTemp: (json['max_temp'] as num)?.toDouble(),
    windSpeed: (json['wind_speed'] as num)?.toDouble(),
    windDirection: (json['wind_direction'] as num)?.toDouble(),
    airPressure: (json['air_pressure'] as num)?.toDouble(),
    humidity: json['humidity'] as int,
    visibility: (json['visibility'] as num)?.toDouble(),
    predictability: json['predictability'] as int,
  );
}

Map<String, dynamic> _$_$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'weather_state_abbr': instance.condition,
      'weather_state_name': instance.formattedCondition,
      'wind_direction_compass': instance.windDirectionCompass,
      'created': instance.created?.toIso8601String(),
      'applicable_date': instance.applicableDate?.toIso8601String(),
      'min_temp': instance.minTemp,
      'temp': instance.temp,
      'max_temp': instance.maxTemp,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
      'air_pressure': instance.airPressure,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'predictability': instance.predictability,
    };
