// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'weather_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WeatherEntityTearOff {
  const _$WeatherEntityTearOff();

  _WeatherEntity call(
      {@required Option<WeatherResponse> weatherResponse,
      @required String city,
      @required Option<DateTime> lastUpdated}) {
    return _WeatherEntity(
      weatherResponse: weatherResponse,
      city: city,
      lastUpdated: lastUpdated,
    );
  }
}

// ignore: unused_element
const $WeatherEntity = _$WeatherEntityTearOff();

mixin _$WeatherEntity {
  Option<WeatherResponse> get weatherResponse;
  String get city;
  Option<DateTime> get lastUpdated;

  $WeatherEntityCopyWith<WeatherEntity> get copyWith;
}

abstract class $WeatherEntityCopyWith<$Res> {
  factory $WeatherEntityCopyWith(
          WeatherEntity value, $Res Function(WeatherEntity) then) =
      _$WeatherEntityCopyWithImpl<$Res>;
  $Res call(
      {Option<WeatherResponse> weatherResponse,
      String city,
      Option<DateTime> lastUpdated});
}

class _$WeatherEntityCopyWithImpl<$Res>
    implements $WeatherEntityCopyWith<$Res> {
  _$WeatherEntityCopyWithImpl(this._value, this._then);

  final WeatherEntity _value;
  // ignore: unused_field
  final $Res Function(WeatherEntity) _then;

  @override
  $Res call({
    Object weatherResponse = freezed,
    Object city = freezed,
    Object lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      weatherResponse: weatherResponse == freezed
          ? _value.weatherResponse
          : weatherResponse as Option<WeatherResponse>,
      city: city == freezed ? _value.city : city as String,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated as Option<DateTime>,
    ));
  }
}

abstract class _$WeatherEntityCopyWith<$Res>
    implements $WeatherEntityCopyWith<$Res> {
  factory _$WeatherEntityCopyWith(
          _WeatherEntity value, $Res Function(_WeatherEntity) then) =
      __$WeatherEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {Option<WeatherResponse> weatherResponse,
      String city,
      Option<DateTime> lastUpdated});
}

class __$WeatherEntityCopyWithImpl<$Res>
    extends _$WeatherEntityCopyWithImpl<$Res>
    implements _$WeatherEntityCopyWith<$Res> {
  __$WeatherEntityCopyWithImpl(
      _WeatherEntity _value, $Res Function(_WeatherEntity) _then)
      : super(_value, (v) => _then(v as _WeatherEntity));

  @override
  _WeatherEntity get _value => super._value as _WeatherEntity;

  @override
  $Res call({
    Object weatherResponse = freezed,
    Object city = freezed,
    Object lastUpdated = freezed,
  }) {
    return _then(_WeatherEntity(
      weatherResponse: weatherResponse == freezed
          ? _value.weatherResponse
          : weatherResponse as Option<WeatherResponse>,
      city: city == freezed ? _value.city : city as String,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated as Option<DateTime>,
    ));
  }
}

class _$_WeatherEntity with DiagnosticableTreeMixin implements _WeatherEntity {
  const _$_WeatherEntity(
      {@required this.weatherResponse,
      @required this.city,
      @required this.lastUpdated})
      : assert(weatherResponse != null),
        assert(city != null),
        assert(lastUpdated != null);

  @override
  final Option<WeatherResponse> weatherResponse;
  @override
  final String city;
  @override
  final Option<DateTime> lastUpdated;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherEntity(weatherResponse: $weatherResponse, city: $city, lastUpdated: $lastUpdated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherEntity'))
      ..add(DiagnosticsProperty('weatherResponse', weatherResponse))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('lastUpdated', lastUpdated));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherEntity &&
            (identical(other.weatherResponse, weatherResponse) ||
                const DeepCollectionEquality()
                    .equals(other.weatherResponse, weatherResponse)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.lastUpdated, lastUpdated) ||
                const DeepCollectionEquality()
                    .equals(other.lastUpdated, lastUpdated)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(weatherResponse) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(lastUpdated);

  @override
  _$WeatherEntityCopyWith<_WeatherEntity> get copyWith =>
      __$WeatherEntityCopyWithImpl<_WeatherEntity>(this, _$identity);
}

abstract class _WeatherEntity implements WeatherEntity {
  const factory _WeatherEntity(
      {@required Option<WeatherResponse> weatherResponse,
      @required String city,
      @required Option<DateTime> lastUpdated}) = _$_WeatherEntity;

  @override
  Option<WeatherResponse> get weatherResponse;
  @override
  String get city;
  @override
  Option<DateTime> get lastUpdated;
  @override
  _$WeatherEntityCopyWith<_WeatherEntity> get copyWith;
}
