// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'weather_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return _WeatherResponse.fromJson(json);
}

class _$WeatherResponseTearOff {
  const _$WeatherResponseTearOff();

  _WeatherResponse call(
      {@JsonKey(name: 'consolidated_weather') List<Weather> weatherCollection,
      @JsonKey(name: 'sources') List<WeatherSource> weatherDataSources,
      @JsonKey(name: 'sun_rise') DateTime sunRise,
      @JsonKey(name: 'sun_set') DateTime sunSet,
      @JsonKey(name: 'woeid') int locationId,
      String title}) {
    return _WeatherResponse(
      weatherCollection: weatherCollection,
      weatherDataSources: weatherDataSources,
      sunRise: sunRise,
      sunSet: sunSet,
      locationId: locationId,
      title: title,
    );
  }
}

// ignore: unused_element
const $WeatherResponse = _$WeatherResponseTearOff();

mixin _$WeatherResponse {
  @JsonKey(name: 'consolidated_weather')
  List<Weather> get weatherCollection;
  @JsonKey(name: 'sources')
  List<WeatherSource> get weatherDataSources;
  @JsonKey(name: 'sun_rise')
  DateTime get sunRise;
  @JsonKey(name: 'sun_set')
  DateTime get sunSet;
  @JsonKey(name: 'woeid')
  int get locationId;
  String get title;

  Map<String, dynamic> toJson();
  $WeatherResponseCopyWith<WeatherResponse> get copyWith;
}

abstract class $WeatherResponseCopyWith<$Res> {
  factory $WeatherResponseCopyWith(
          WeatherResponse value, $Res Function(WeatherResponse) then) =
      _$WeatherResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'consolidated_weather') List<Weather> weatherCollection,
      @JsonKey(name: 'sources') List<WeatherSource> weatherDataSources,
      @JsonKey(name: 'sun_rise') DateTime sunRise,
      @JsonKey(name: 'sun_set') DateTime sunSet,
      @JsonKey(name: 'woeid') int locationId,
      String title});
}

class _$WeatherResponseCopyWithImpl<$Res>
    implements $WeatherResponseCopyWith<$Res> {
  _$WeatherResponseCopyWithImpl(this._value, this._then);

  final WeatherResponse _value;
  // ignore: unused_field
  final $Res Function(WeatherResponse) _then;

  @override
  $Res call({
    Object weatherCollection = freezed,
    Object weatherDataSources = freezed,
    Object sunRise = freezed,
    Object sunSet = freezed,
    Object locationId = freezed,
    Object title = freezed,
  }) {
    return _then(_value.copyWith(
      weatherCollection: weatherCollection == freezed
          ? _value.weatherCollection
          : weatherCollection as List<Weather>,
      weatherDataSources: weatherDataSources == freezed
          ? _value.weatherDataSources
          : weatherDataSources as List<WeatherSource>,
      sunRise: sunRise == freezed ? _value.sunRise : sunRise as DateTime,
      sunSet: sunSet == freezed ? _value.sunSet : sunSet as DateTime,
      locationId: locationId == freezed ? _value.locationId : locationId as int,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

abstract class _$WeatherResponseCopyWith<$Res>
    implements $WeatherResponseCopyWith<$Res> {
  factory _$WeatherResponseCopyWith(
          _WeatherResponse value, $Res Function(_WeatherResponse) then) =
      __$WeatherResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'consolidated_weather') List<Weather> weatherCollection,
      @JsonKey(name: 'sources') List<WeatherSource> weatherDataSources,
      @JsonKey(name: 'sun_rise') DateTime sunRise,
      @JsonKey(name: 'sun_set') DateTime sunSet,
      @JsonKey(name: 'woeid') int locationId,
      String title});
}

class __$WeatherResponseCopyWithImpl<$Res>
    extends _$WeatherResponseCopyWithImpl<$Res>
    implements _$WeatherResponseCopyWith<$Res> {
  __$WeatherResponseCopyWithImpl(
      _WeatherResponse _value, $Res Function(_WeatherResponse) _then)
      : super(_value, (v) => _then(v as _WeatherResponse));

  @override
  _WeatherResponse get _value => super._value as _WeatherResponse;

  @override
  $Res call({
    Object weatherCollection = freezed,
    Object weatherDataSources = freezed,
    Object sunRise = freezed,
    Object sunSet = freezed,
    Object locationId = freezed,
    Object title = freezed,
  }) {
    return _then(_WeatherResponse(
      weatherCollection: weatherCollection == freezed
          ? _value.weatherCollection
          : weatherCollection as List<Weather>,
      weatherDataSources: weatherDataSources == freezed
          ? _value.weatherDataSources
          : weatherDataSources as List<WeatherSource>,
      sunRise: sunRise == freezed ? _value.sunRise : sunRise as DateTime,
      sunSet: sunSet == freezed ? _value.sunSet : sunSet as DateTime,
      locationId: locationId == freezed ? _value.locationId : locationId as int,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable()
class _$_WeatherResponse
    with DiagnosticableTreeMixin
    implements _WeatherResponse {
  const _$_WeatherResponse(
      {@JsonKey(name: 'consolidated_weather') this.weatherCollection,
      @JsonKey(name: 'sources') this.weatherDataSources,
      @JsonKey(name: 'sun_rise') this.sunRise,
      @JsonKey(name: 'sun_set') this.sunSet,
      @JsonKey(name: 'woeid') this.locationId,
      this.title});

  factory _$_WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_WeatherResponseFromJson(json);

  @override
  @JsonKey(name: 'consolidated_weather')
  final List<Weather> weatherCollection;
  @override
  @JsonKey(name: 'sources')
  final List<WeatherSource> weatherDataSources;
  @override
  @JsonKey(name: 'sun_rise')
  final DateTime sunRise;
  @override
  @JsonKey(name: 'sun_set')
  final DateTime sunSet;
  @override
  @JsonKey(name: 'woeid')
  final int locationId;
  @override
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherResponse(weatherCollection: $weatherCollection, weatherDataSources: $weatherDataSources, sunRise: $sunRise, sunSet: $sunSet, locationId: $locationId, title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherResponse'))
      ..add(DiagnosticsProperty('weatherCollection', weatherCollection))
      ..add(DiagnosticsProperty('weatherDataSources', weatherDataSources))
      ..add(DiagnosticsProperty('sunRise', sunRise))
      ..add(DiagnosticsProperty('sunSet', sunSet))
      ..add(DiagnosticsProperty('locationId', locationId))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherResponse &&
            (identical(other.weatherCollection, weatherCollection) ||
                const DeepCollectionEquality()
                    .equals(other.weatherCollection, weatherCollection)) &&
            (identical(other.weatherDataSources, weatherDataSources) ||
                const DeepCollectionEquality()
                    .equals(other.weatherDataSources, weatherDataSources)) &&
            (identical(other.sunRise, sunRise) ||
                const DeepCollectionEquality()
                    .equals(other.sunRise, sunRise)) &&
            (identical(other.sunSet, sunSet) ||
                const DeepCollectionEquality().equals(other.sunSet, sunSet)) &&
            (identical(other.locationId, locationId) ||
                const DeepCollectionEquality()
                    .equals(other.locationId, locationId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(weatherCollection) ^
      const DeepCollectionEquality().hash(weatherDataSources) ^
      const DeepCollectionEquality().hash(sunRise) ^
      const DeepCollectionEquality().hash(sunSet) ^
      const DeepCollectionEquality().hash(locationId) ^
      const DeepCollectionEquality().hash(title);

  @override
  _$WeatherResponseCopyWith<_WeatherResponse> get copyWith =>
      __$WeatherResponseCopyWithImpl<_WeatherResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WeatherResponseToJson(this);
  }
}

abstract class _WeatherResponse implements WeatherResponse {
  const factory _WeatherResponse(
      {@JsonKey(name: 'consolidated_weather') List<Weather> weatherCollection,
      @JsonKey(name: 'sources') List<WeatherSource> weatherDataSources,
      @JsonKey(name: 'sun_rise') DateTime sunRise,
      @JsonKey(name: 'sun_set') DateTime sunSet,
      @JsonKey(name: 'woeid') int locationId,
      String title}) = _$_WeatherResponse;

  factory _WeatherResponse.fromJson(Map<String, dynamic> json) =
      _$_WeatherResponse.fromJson;

  @override
  @JsonKey(name: 'consolidated_weather')
  List<Weather> get weatherCollection;
  @override
  @JsonKey(name: 'sources')
  List<WeatherSource> get weatherDataSources;
  @override
  @JsonKey(name: 'sun_rise')
  DateTime get sunRise;
  @override
  @JsonKey(name: 'sun_set')
  DateTime get sunSet;
  @override
  @JsonKey(name: 'woeid')
  int get locationId;
  @override
  String get title;
  @override
  _$WeatherResponseCopyWith<_WeatherResponse> get copyWith;
}
