// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherSource _$_$_WeatherSourceFromJson(Map<String, dynamic> json) {
  return _$_WeatherSource(
    crawlRate: json['crawl_rate'] as int,
    title: json['title'] as String,
    slug: json['slug'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$_$_WeatherSourceToJson(_$_WeatherSource instance) =>
    <String, dynamic>{
      'crawl_rate': instance.crawlRate,
      'title': instance.title,
      'slug': instance.slug,
      'url': instance.url,
    };
