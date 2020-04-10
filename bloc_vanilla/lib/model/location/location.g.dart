// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Location _$_$_LocationFromJson(Map<String, dynamic> json) {
  return _$_Location(
    title: json['title'] as String,
    locationType: json['location_type'] as String,
    woeId: json['woeid'] as int,
    lattLong: json['latt_long'] as String,
    distance: json['distance'] as int,
  );
}

Map<String, dynamic> _$_$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'title': instance.title,
      'location_type': instance.locationType,
      'woeid': instance.woeId,
      'latt_long': instance.lattLong,
      'distance': instance.distance,
    };
