// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherResponse _$_$_WeatherResponseFromJson(Map<String, dynamic> json) {
  return _$_WeatherResponse(
    weatherCollection: (json['consolidated_weather'] as List)
        ?.map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    weatherDataSources: (json['sources'] as List)
        ?.map((e) => e == null
            ? null
            : WeatherSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sunRise: json['sun_rise'] == null
        ? null
        : DateTime.parse(json['sun_rise'] as String),
    sunSet: json['sun_set'] == null
        ? null
        : DateTime.parse(json['sun_set'] as String),
    locationId: json['woeid'] as int,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$_$_WeatherResponseToJson(_$_WeatherResponse instance) =>
    <String, dynamic>{
      'consolidated_weather': instance.weatherCollection,
      'sources': instance.weatherDataSources,
      'sun_rise': instance.sunRise?.toIso8601String(),
      'sun_set': instance.sunSet?.toIso8601String(),
      'woeid': instance.locationId,
      'title': instance.title,
    };
