// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'weather_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WeatherEventTearOff {
  const _$WeatherEventTearOff();

  FetchWeather fetchWeatherForLocation(String location) {
    return FetchWeather(
      location,
    );
  }

  RefreshWeather refreshWeatherForLocation(String location) {
    return RefreshWeather(
      location,
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
      location == freezed ? _value.location : location as String,
    ));
  }
}

class _$FetchWeather implements FetchWeather {
  const _$FetchWeather(this.location) : assert(location != null);

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
  const factory FetchWeather(String location) = _$FetchWeather;

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
      location == freezed ? _value.location : location as String,
    ));
  }
}

class _$RefreshWeather implements RefreshWeather {
  const _$RefreshWeather(this.location) : assert(location != null);

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
  const factory RefreshWeather(String location) = _$RefreshWeather;

  @override
  String get location;
  @override
  $RefreshWeatherCopyWith<RefreshWeather> get copyWith;
}

class _$WeatherStateTearOff {
  const _$WeatherStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Loading loading() {
    return const Loading();
  }

  LoadingFailure loadingFailure() {
    return const LoadingFailure();
  }

  Loaded loaded(WeatherEntity weatherEntity) {
    return Loaded(
      weatherEntity,
    );
  }
}

// ignore: unused_element
const $WeatherState = _$WeatherStateTearOff();

mixin _$WeatherState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadingFailure(),
    @required Result loaded(WeatherEntity weatherEntity),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadingFailure(),
    Result loaded(WeatherEntity weatherEntity),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result loadingFailure(LoadingFailure value),
    @required Result loaded(Loaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result loadingFailure(LoadingFailure value),
    Result loaded(Loaded value),
    @required Result orElse(),
  });
}

abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res>;
}

class _$WeatherStateCopyWithImpl<$Res> implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  final WeatherState _value;
  // ignore: unused_field
  final $Res Function(WeatherState) _then;
}

abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

class _$InitialCopyWithImpl<$Res> extends _$WeatherStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'WeatherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadingFailure(),
    @required Result loaded(WeatherEntity weatherEntity),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingFailure != null);
    assert(loaded != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadingFailure(),
    Result loaded(WeatherEntity weatherEntity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result loadingFailure(LoadingFailure value),
    @required Result loaded(Loaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingFailure != null);
    assert(loaded != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result loadingFailure(LoadingFailure value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements WeatherState {
  const factory Initial() = _$Initial;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$WeatherStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'WeatherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadingFailure(),
    @required Result loaded(WeatherEntity weatherEntity),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingFailure != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadingFailure(),
    Result loaded(WeatherEntity weatherEntity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result loadingFailure(LoadingFailure value),
    @required Result loaded(Loaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingFailure != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result loadingFailure(LoadingFailure value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements WeatherState {
  const factory Loading() = _$Loading;
}

abstract class $LoadingFailureCopyWith<$Res> {
  factory $LoadingFailureCopyWith(
          LoadingFailure value, $Res Function(LoadingFailure) then) =
      _$LoadingFailureCopyWithImpl<$Res>;
}

class _$LoadingFailureCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res>
    implements $LoadingFailureCopyWith<$Res> {
  _$LoadingFailureCopyWithImpl(
      LoadingFailure _value, $Res Function(LoadingFailure) _then)
      : super(_value, (v) => _then(v as LoadingFailure));

  @override
  LoadingFailure get _value => super._value as LoadingFailure;
}

class _$LoadingFailure implements LoadingFailure {
  const _$LoadingFailure();

  @override
  String toString() {
    return 'WeatherState.loadingFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadingFailure(),
    @required Result loaded(WeatherEntity weatherEntity),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingFailure != null);
    assert(loaded != null);
    return loadingFailure();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadingFailure(),
    Result loaded(WeatherEntity weatherEntity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingFailure != null) {
      return loadingFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result loadingFailure(LoadingFailure value),
    @required Result loaded(Loaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingFailure != null);
    assert(loaded != null);
    return loadingFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result loadingFailure(LoadingFailure value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingFailure != null) {
      return loadingFailure(this);
    }
    return orElse();
  }
}

abstract class LoadingFailure implements WeatherState {
  const factory LoadingFailure() = _$LoadingFailure;
}

abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({WeatherEntity weatherEntity});

  $WeatherEntityCopyWith<$Res> get weatherEntity;
}

class _$LoadedCopyWithImpl<$Res> extends _$WeatherStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object weatherEntity = freezed,
  }) {
    return _then(Loaded(
      weatherEntity == freezed
          ? _value.weatherEntity
          : weatherEntity as WeatherEntity,
    ));
  }

  @override
  $WeatherEntityCopyWith<$Res> get weatherEntity {
    if (_value.weatherEntity == null) {
      return null;
    }
    return $WeatherEntityCopyWith<$Res>(_value.weatherEntity, (value) {
      return _then(_value.copyWith(weatherEntity: value));
    });
  }
}

class _$Loaded implements Loaded {
  const _$Loaded(this.weatherEntity) : assert(weatherEntity != null);

  @override
  final WeatherEntity weatherEntity;

  @override
  String toString() {
    return 'WeatherState.loaded(weatherEntity: $weatherEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded &&
            (identical(other.weatherEntity, weatherEntity) ||
                const DeepCollectionEquality()
                    .equals(other.weatherEntity, weatherEntity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(weatherEntity);

  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadingFailure(),
    @required Result loaded(WeatherEntity weatherEntity),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingFailure != null);
    assert(loaded != null);
    return loaded(weatherEntity);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadingFailure(),
    Result loaded(WeatherEntity weatherEntity),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(weatherEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result loadingFailure(LoadingFailure value),
    @required Result loaded(Loaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingFailure != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result loadingFailure(LoadingFailure value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements WeatherState {
  const factory Loaded(WeatherEntity weatherEntity) = _$Loaded;

  WeatherEntity get weatherEntity;
  $LoadedCopyWith<Loaded> get copyWith;
}
