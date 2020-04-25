// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'weather_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WeatherEventTearOff {
  const _$WeatherEventTearOff();

  FetchWeather fetchWeatherForLocation({String location}) {
    return FetchWeather(
      location: location,
    );
  }

  RefreshWeather refreshWeatherForLocation({String location}) {
    return RefreshWeather(
      location: location,
    );
  }
}

// ignore: unused_element
const $WeatherEvent = _$WeatherEventTearOff();

mixin _$WeatherEvent {
  String get location;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchWeatherForLocation(String location),
    @required Result refreshWeatherForLocation(String location),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchWeatherForLocation(String location),
    Result refreshWeatherForLocation(String location),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchWeatherForLocation(FetchWeather value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchWeatherForLocation(FetchWeather value),
    Result refreshWeatherForLocation(RefreshWeather value),
    @required Result orElse(),
  });

  $WeatherEventCopyWith<WeatherEvent> get copyWith;
}

abstract class $WeatherEventCopyWith<$Res> {
  factory $WeatherEventCopyWith(
          WeatherEvent value, $Res Function(WeatherEvent) then) =
      _$WeatherEventCopyWithImpl<$Res>;
  $Res call({String location});
}

class _$WeatherEventCopyWithImpl<$Res> implements $WeatherEventCopyWith<$Res> {
  _$WeatherEventCopyWithImpl(this._value, this._then);

  final WeatherEvent _value;
  // ignore: unused_field
  final $Res Function(WeatherEvent) _then;

  @override
  $Res call({
    Object location = freezed,
  }) {
    return _then(_value.copyWith(
      location: location == freezed ? _value.location : location as String,
    ));
  }
}

abstract class $FetchWeatherCopyWith<$Res>
    implements $WeatherEventCopyWith<$Res> {
  factory $FetchWeatherCopyWith(
          FetchWeather value, $Res Function(FetchWeather) then) =
      _$FetchWeatherCopyWithImpl<$Res>;
  @override
  $Res call({String location});
}

class _$FetchWeatherCopyWithImpl<$Res> extends _$WeatherEventCopyWithImpl<$Res>
    implements $FetchWeatherCopyWith<$Res> {
  _$FetchWeatherCopyWithImpl(
      FetchWeather _value, $Res Function(FetchWeather) _then)
      : super(_value, (v) => _then(v as FetchWeather));

  @override
  FetchWeather get _value => super._value as FetchWeather;

  @override
  $Res call({
    Object location = freezed,
  }) {
    return _then(FetchWeather(
      location: location == freezed ? _value.location : location as String,
    ));
  }
}

class _$FetchWeather implements FetchWeather {
  const _$FetchWeather({this.location});

  @override
  final String location;

  @override
  String toString() {
    return 'WeatherEvent.fetchWeatherForLocation(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchWeather &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(location);

  @override
  $FetchWeatherCopyWith<FetchWeather> get copyWith =>
      _$FetchWeatherCopyWithImpl<FetchWeather>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchWeatherForLocation(String location),
    @required Result refreshWeatherForLocation(String location),
  }) {
    assert(fetchWeatherForLocation != null);
    assert(refreshWeatherForLocation != null);
    return fetchWeatherForLocation(location);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchWeatherForLocation(String location),
    Result refreshWeatherForLocation(String location),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchWeatherForLocation != null) {
      return fetchWeatherForLocation(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchWeatherForLocation(FetchWeather value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  }) {
    assert(fetchWeatherForLocation != null);
    assert(refreshWeatherForLocation != null);
    return fetchWeatherForLocation(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchWeatherForLocation(FetchWeather value),
    Result refreshWeatherForLocation(RefreshWeather value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchWeatherForLocation != null) {
      return fetchWeatherForLocation(this);
    }
    return orElse();
  }
}

abstract class FetchWeather implements WeatherEvent {
  const factory FetchWeather({String location}) = _$FetchWeather;

  @override
  String get location;
  @override
  $FetchWeatherCopyWith<FetchWeather> get copyWith;
}

abstract class $RefreshWeatherCopyWith<$Res>
    implements $WeatherEventCopyWith<$Res> {
  factory $RefreshWeatherCopyWith(
          RefreshWeather value, $Res Function(RefreshWeather) then) =
      _$RefreshWeatherCopyWithImpl<$Res>;
  @override
  $Res call({String location});
}

class _$RefreshWeatherCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res>
    implements $RefreshWeatherCopyWith<$Res> {
  _$RefreshWeatherCopyWithImpl(
      RefreshWeather _value, $Res Function(RefreshWeather) _then)
      : super(_value, (v) => _then(v as RefreshWeather));

  @override
  RefreshWeather get _value => super._value as RefreshWeather;

  @override
  $Res call({
    Object location = freezed,
  }) {
    return _then(RefreshWeather(
      location: location == freezed ? _value.location : location as String,
    ));
  }
}

class _$RefreshWeather implements RefreshWeather {
  const _$RefreshWeather({this.location});

  @override
  final String location;

  @override
  String toString() {
    return 'WeatherEvent.refreshWeatherForLocation(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RefreshWeather &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(location);

  @override
  $RefreshWeatherCopyWith<RefreshWeather> get copyWith =>
      _$RefreshWeatherCopyWithImpl<RefreshWeather>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchWeatherForLocation(String location),
    @required Result refreshWeatherForLocation(String location),
  }) {
    assert(fetchWeatherForLocation != null);
    assert(refreshWeatherForLocation != null);
    return refreshWeatherForLocation(location);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchWeatherForLocation(String location),
    Result refreshWeatherForLocation(String location),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshWeatherForLocation != null) {
      return refreshWeatherForLocation(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchWeatherForLocation(FetchWeather value),
    @required Result refreshWeatherForLocation(RefreshWeather value),
  }) {
    assert(fetchWeatherForLocation != null);
    assert(refreshWeatherForLocation != null);
    return refreshWeatherForLocation(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchWeatherForLocation(FetchWeather value),
    Result refreshWeatherForLocation(RefreshWeather value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshWeatherForLocation != null) {
      return refreshWeatherForLocation(this);
    }
    return orElse();
  }
}

abstract class RefreshWeather implements WeatherEvent {
  const factory RefreshWeather({String location}) = _$RefreshWeather;

  @override
  String get location;
  @override
  $RefreshWeatherCopyWith<RefreshWeather> get copyWith;
}
